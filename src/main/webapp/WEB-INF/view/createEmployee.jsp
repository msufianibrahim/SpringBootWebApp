<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Employee</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        function createEmployee() {
            // Prepare the employee data
            var employee = {
                employeeName: $('#employeeName').val(),
                salary: $('#salary').val(),
                departmentId: $('#departmentId').val()
            };

            // Send a POST request to create the employee
            $.ajax({
                url: '/spring-boot-demo/employee/create',
                type: 'POST',
                data: JSON.stringify(employee),
                contentType: 'application/json',
                success: function() {
                    window.location.href = 'http://localhost:8080/spring-boot-demo/employee/index';
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log(xhr.responseText);
                }
            });
        }

        $(document).ready(function() {
            // Attach the createEmployee function to the "Create" button click event
            $('#create').click(function(event) {
                event.preventDefault();
                createEmployee();
            });
        });
    </script>
</head>
<body>
    <h1>Create Employee</h1>

    <form>
        <label for="employeeName">Employee Name:</label>
        <input type="text" id="employeeName" name="employeeName" required><br><br>

        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="salary" required><br><br>

        <label for="departmentId">Department ID:</label>
        <input type="number" id="departmentId" name="departmentId" required><br><br>

        <input type="submit" id="create" value="Create">
    </form>
</body>
</html>
