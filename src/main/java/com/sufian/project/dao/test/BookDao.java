package com.sufian.project.dao.test;

import java.util.List;

import com.sufian.project.entity.test.Book;
public interface BookDao {
    List<Book> getAllBooks();
    Book getBookById(Long id);
    void createBook(Book book);
    void updateBook(Book book);
    void deleteBook(Long id);
}
