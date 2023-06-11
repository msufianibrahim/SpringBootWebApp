<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Book</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
        function createBook() {
            // Prepare the book data
            var book = {
            title: $('#title').val(),
            author: $('#author').val()
        };

         // Send a POST request to create the book
            $.ajax({
                url: '/spring-boot-demo/book/create',
                type: 'POST',
                data: JSON.stringify(book),
                contentType: 'application/json',
                success: function() {
                    window.location.href = 'http://localhost:8080/spring-boot-demo/book/index';
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log(xhr.responseText);
                }
            });
        }

        $(document).ready(function() {
            // Attach the createBook function to the "Create" button click event
            $('#create').click(function(event) {
                event.preventDefault();
                createBook();
            });
        });
    </script>
</head>
<body>
    <h1>Create Book</h1>
    
    <form>
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="author">Author:</label>
        <input type="text" id="author" name="author" required><br><br>
        
        <input type="submit" id="create" value="Create">
    </form>
</body>
</html>
