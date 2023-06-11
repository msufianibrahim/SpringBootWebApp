package com.sufian.project.service;

import java.util.List;

import com.sufian.project.entity.test.Book;

/**
 * one service interface for each entity assuming each entity will have more and distinct methods in the future
 */

public interface BookService {
	
	List<Book> getAllBooks();
    Book getBookById(Long id);
    Book createBook(Book book);
    Book updateBook(Long id, Book book);
    void deleteBook(Long id);
}
