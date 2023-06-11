<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List Books</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
	    function edit(bookId) {
	        // Redirect to the edit book page with the book ID
	        window.location.href = '/spring-boot-demo/book/edit/' + bookId;
	    }
        function remove(bookId) {
            if (confirm('Are you sure you want to delete this book?')) {
                // Send a DELETE request to delete the book
                $.ajax({
                    url: '/spring-boot-demo/book/' + bookId,
                    type: 'DELETE',
                    success: function() {
                        loadBooks(); // Reload the books after deletion
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log(xhr.responseText);
                    }
                });
            }
        }
        function loadBooks() {
            $.ajax({
                url: '/spring-boot-demo/book/list', // URL mapping to retrieve all books
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    displayBooks(data); // Pass the book data to the displayBooks() function
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log(xhr.responseText);
                }
            });
        }
        function displayBooks(books) {
            var tableBody = $('#books'); // Get the table body element

            // Clear the existing table rows
            tableBody.empty();

            // Iterate over each book and add a row to the table
            books.forEach(function(book) {
                var row = '<tr>' +
                    '<td>' + book.id + '</td>' +
                    '<td>' + book.title + '</td>' +
                    '<td>' + book.author + '</td>' +
                    '<td>' +
                    '<button onclick="edit(' + book.id + ')">Update</button>' +
                    '<button onclick="remove(' + book.id + ')">Delete</button>' +
                    '</td>' +
                    '</tr>';

                tableBody.append(row); // Append the row to the table body
            });
        }
        $(document).ready(function() {
            function newBook() {
                console.log("create run");
                // Redirect to the create book page
                window.location.href = 'http://localhost:8080/spring-boot-demo/book/create';
            }

            loadBooks(); // Load books on page load

            $('#new').click(function() {
                newBook();
            });
            
        });
    </script>
</head>
<body>
    <h2>List Books</h2>
    <hr />
    <table border="1" style="width: 70%">
        <thead>
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Author</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="books">
            <!-- Book rows will be populated dynamically -->
        </tbody>
    </table>
    <input type="button" id="new" value="New">
</body>
</html>
