<!DOCTYPE html>
<html>
<head>
    <title>Edit Department</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        function updateDepartment() {
            var id = $('#id').val();
            var departmentName = $('#departmentName').val();
            
            // Create a department object with the updated details
            var department = {
                id: id,
                departmentName: departmentName
            };

            // Send a PUT request to update the department
            $.ajax({
                url: '/spring-boot-demo/department/update/' + id,
                type: 'PUT',
                data: JSON.stringify(department),
                contentType: 'application/json',
                success: function() {
                    // Redirect to the department list page after successful update
                    window.location.href = '/spring-boot-demo/department/index';
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log(xhr.responseText);
                }
            });
        }

        $(document).ready(function() {
            // Retrieve the department ID from the URL query parameter
            var departmentId = <%= request.getAttribute("departmentId") %>; // Get the departmentId value from the model
            loadDepartment();
            
            // Make AJAX call to retrieve department details
            function loadDepartment() {
                $.ajax({
                    url: '/spring-boot-demo/department/' + departmentId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        // Handle the department details response
                        displayDepartment(data);
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log(xhr.responseText);
                    }
                });
            }
            
            function displayDepartment(department) {
                // Update the form fields with the department details
                $('#id').val(departmentId);
                $('#departmentName').val(department.departmentName);
            }
            
            // Attach the updateDepartment function to the "Update" button click event
            $('#update').click(function(event) {
                event.preventDefault();
                updateDepartment();
            });
        });
    </script>
</head>
<body>
    <h2>Edit Department</h2>
    <hr />
    <form id="editForm" method="post">
        <div>
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" readonly />
        </div>
        <div>
            <label for="departmentName">Department Name:</label>
            <input type="text" id="departmentName" name="departmentName" required />
        </div>
        <div>
            <input type="submit" id="update" value="Update" />
        </div>
    </form>
</body>
</html>
