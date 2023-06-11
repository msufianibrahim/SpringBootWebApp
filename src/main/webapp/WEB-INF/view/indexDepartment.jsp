<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Departments</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        function edit(departmentId) {
            // Redirect to the edit department page with the department ID
            window.location.href = '/spring-boot-demo/department/edit/' + departmentId;
        }

        function remove(departmentId) {
            if (confirm('Are you sure you want to delete this department?')) {
                // Send a DELETE request to delete the department
                $.ajax({
                    url: '/spring-boot-demo/department/' + departmentId,
                    type: 'DELETE',
                    success: function () {
                        loadDepartments(); // Reload the departments after deletion
                    },
                    error: function (xhr, textStatus, errorThrown) {
                        console.log(xhr.responseText);
                    }
                });
            }
        }

        function loadDepartments() {
            $.ajax({
                url: '/spring-boot-demo/department/list', // URL mapping to retrieve all departments
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    displayDepartments(data); // Pass the department data to the displayDepartments() function
                },
                error: function (xhr, textStatus, errorThrown) {
                    console.log(xhr.responseText);
                }
            });
        }

        function displayDepartments(departments) {
            var tableBody = $('#departments'); // Get the table body element
			console.log(departments);
            // Clear the existing table rows
            tableBody.empty();

            // Iterate over each department and add a row to the table
            departments.forEach(function (department) {
                var row = '<tr>' +
                    '<td>' + department.id + '</td>' +
                    '<td>' + department.departmentName + '</td>' +
                    '<td>' +
                    '<button onclick="edit(' + department.id + ')">Update</button>' +
                    '<button onclick="remove(' + department.id + ')">Delete</button>' +
                    '</td>' +
                    '</tr>';

                tableBody.append(row); // Append the row to the table body
            });
        }

        $(document).ready(function () {
            function newDepartment() {
                console.log("create run");
                // Redirect to the create department page
                window.location.href = 'http://localhost:8080/spring-boot-demo/department/create';
            }

            loadDepartments(); // Load departments on page load

            $('#new').click(function () {
                newDepartment();
            });

        });
    </script>
</head>
<body>
<h2>List Departments</h2>
<hr/>
<table border="1" style="width: 70%">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody id="departments">
    <!-- Department rows will be populated dynamically -->
    </tbody>
</table>
<input type="button" id="new" value="New">
</body>
</html>
