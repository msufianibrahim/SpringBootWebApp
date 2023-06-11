<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Department</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        function createDepartment() {
            // Prepare the department data
            var department = {
                departmentName: $('#departmentName').val()
            };

            // Send a POST request to create the department
            $.ajax({
                url: '/spring-boot-demo/department/create',
                type: 'POST',
                data: JSON.stringify(department),
                contentType: 'application/json',
                success: function() {
                    window.location.href = 'http://localhost:8080/spring-boot-demo/department/index';
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log(xhr.responseText);
                }
            });
        }

        $(document).ready(function() {
            // Attach the createDepartment function to the "Create" button click event
            $('#create').click(function(event) {
                event.preventDefault();
                createDepartment();
            });
        });
    </script>
</head>
<body>
    <h1>Create Department</h1>

    <form>
        <label for="departmentName">Department Name:</label>
        <input type="text" id="departmentName" name="departmentName" required><br><br>

        <input type="submit" id="create" value="Create">
    </form>
</body>
</html>
