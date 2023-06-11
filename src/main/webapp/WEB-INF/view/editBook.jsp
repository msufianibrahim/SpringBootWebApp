<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    function updateBook() {
        var id = $('#id').val();
        var title = $('#title').val();
        var author = $('#author').val();
        
        // Create a book object with the updated details
        var book = {
            id: id,
            title: title,
            author: author
        };

        // Send a PUT request to update the book
        $.ajax({
            url: '/spring-boot-demo/book/update/' + id,
            type: 'PUT',
            data: JSON.stringify(book),
            contentType: 'application/json',
            success: function() {
                // Redirect to the book list page after successful update
                window.location.href = '/spring-boot-demo/book/index';
            },
            error: function(xhr, textStatus, errorThrown) {
                console.log(xhr.responseText);
            }
        });
    }
        $(document).ready(function() {
            // Retrieve the book ID from the URL query parameter
            var bookId = <%= request.getAttribute("bookId") %>; // Get the bookId value from the model
            loadBooks();
	        // Make AJAX call to retrieve book details
	        function loadBooks() {
		        $.ajax({
		            url: '/spring-boot-demo/book/' + bookId,
		            type: 'GET',
		            dataType: 'json',
		            success: function(data) {
		                // Handle the book details response
		                displayBook(data);
		            },
		            error: function(xhr, textStatus, errorThrown) {
		                console.log(xhr.responseText);
		            }
		        });
            }
            
            
	        function displayBook(book) {
	            // Update the form fields with the book details
	            $('#id').val(bookId);
	            $('#title').val(book.title);
	            $('#author').val(book.author);
	        }
	        
	     // Attach the updateBook function to the "Update" button click event
            $('#update').click(function(event) {
                event.preventDefault();
                updateBook();
            });
        });
    </script>
</head>
<body>
    <h2>Edit Book</h2>
    <hr />
    <form id="editForm" method="post">
        <div>
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" readonly />
        </div>
        <div>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required />
        </div>
        <div>
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required />
        </div>
        <div>
            <input type="submit" id="update" value="Update" />
        </div>
    </form>
</body>
</html>
