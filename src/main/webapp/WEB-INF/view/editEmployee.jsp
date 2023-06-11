<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        function updateEmployee() {
            var id = $('#id').val();
            var employeeName = $('#employeeName').val();
            var salary = $('#salary').val();
            var departmentId = $('#departmentId').val();
            
            // Create an employee object with the updated details
            var employee = {
                id: id,
                employeeName: employeeName,
                salary: salary,
                departmentId: departmentId
            };

            // Send a PUT request to update the employee
            $.ajax({
                url: '/spring-boot-demo/employee/update/' + id,
                type: 'PUT',
                data: JSON.stringify(employee),
                contentType: 'application/json',
                success: function() {
                    // Redirect to the employee list page after successful update
                    window.location.href = '/spring-boot-demo/employee/index';
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log(xhr.responseText);
                }
            });
        }

        $(document).ready(function() {
            // Retrieve the employee ID from the URL query parameter
            var employeeId = <%= request.getAttribute("employeeId") %>; // Get the employeeId value from the model
            loadEmployee();
            
            // Make AJAX call to retrieve employee details
            function loadEmployee() {
                $.ajax({
                    url: '/spring-boot-demo/employee/' + employeeId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        // Handle the employee details response
                        displayEmployee(data);
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log(xhr.responseText);
                    }
                });
            }
            
            function displayEmployee(employee) {
                // Update the form fields with the employee details
                $('#id').val(employeeId);
                $('#employeeName').val(employee.employeeName);
                $('#salary').val(employee.salary);
                $('#departmentId').val(employee.departmentId);
            }
            
            // Attach the updateEmployee function to the "Update" button click event
            $('#update').click(function(event) {
                event.preventDefault();
                updateEmployee();
            });
        });
    </script>
</head>
<body>
    <h2>Edit Employee</h2>
    <hr />
    <form id="editForm" method="post">
        <div>
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" readonly />
        </div>
        <div>
            <label for="employeeName">Employee Name:</label>
            <input type="text" id="employeeName" name="employeeName" required />
        </div>
        <div>
            <label for="salary">Salary:</label>
            <input type="number" id="salary" name="salary" required />
        </div>
        <div>
            <label for="departmentId">Department ID:</label>
            <input type="number" id="departmentId" name="departmentId" required />
        </div>
        <div>
            <input type="submit" id="update" value="Update" />
        </div>
    </form>
</body>
</html>
