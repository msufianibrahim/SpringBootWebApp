<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List Employees</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
	    function edit(employeeId) {
	        // Redirect to the edit employee page with the employee ID
	        window.location.href = '/spring-boot-demo/employee/edit/' + employeeId;
	    }
        function remove(employeeId) {
            if (confirm('Are you sure you want to delete this employee?')) {
                // Send a DELETE request to delete the employee
                $.ajax({
                    url: '/spring-boot-demo/employee/' + employeeId,
                    type: 'DELETE',
                    success: function() {
                        loadEmployees(); // Reload the employees after deletion
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log(xhr.responseText);
                    }
                });
            }
        }
        function loadEmployees() {
            $.ajax({
                url: '/spring-boot-demo/employee/list', // URL mapping to retrieve all employees
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    displayEmployees(data); // Pass the employee data to the displayEmployees() function
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log(xhr.responseText);
                }
            });
        }
        function displayEmployees(employees) {
            var tableBody = $('#employees'); // Get the table body element

            // Clear the existing table rows
            tableBody.empty();

            // Iterate over each employee and add a row to the table
            employees.forEach(function(employee) {
                var row = '<tr>' +
                    '<td>' + employee.id + '</td>' +
                    '<td>' + employee.employeeName + '</td>' +
                    '<td>' + employee.salary + '</td>' +
                    '<td>' + employee.departmentId + '</td>' +
                    '<td>' +
                    '<button onclick="edit(' + employee.id + ')">Update</button>' +
                    '<button onclick="remove(' + employee.id + ')">Delete</button>' +
                    '</td>' +
                    '</tr>';

                tableBody.append(row); // Append the row to the table body
            });
        }
        $(document).ready(function() {
            function newEmployee() {
                console.log("create run");
                // Redirect to the create employee page
                window.location.href = 'http://localhost:8080/spring-boot-demo/employee/create';
            }

            loadEmployees(); // Load employees on page load

            $('#new').click(function() {
                newEmployee();
            });
            
        });
    </script>
</head>
<body>
    <h2>List Employees</h2>
    <hr />
    <table border="1" style="width: 70%">
        <thead>
            <tr>
                <th>Id</th>
                <th>Employee Name</th>
                <th>Salary</th>
                <th>Department ID</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="employees">
            <!-- Employee rows will be populated dynamically -->
        </tbody>
    </table>
    <input type="button" id="new" value="New">
</body>
</html>
