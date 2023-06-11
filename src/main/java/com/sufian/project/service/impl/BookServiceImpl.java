package com.sufian.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sufian.project.dao.test.BookDao;
import com.sufian.project.entity.test.Book;
import com.sufian.project.service.BookService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Optional;

@Service
public class BookServiceImpl implements BookService {
    private final BookDao bookDao;
    
    private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);

    
    @Autowired
    public BookServiceImpl(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    public Book createBook(Book book) {
        bookDao.createBook(book);
        return book;
    }

    @Override
    public void deleteBook(Long id) {
    	bookDao.deleteBook(id);
    }

    @Override
    public Book getBookById(Long id) {
        Optional<Book> bookOptional = Optional.ofNullable(bookDao.getBookById(id));
        return bookOptional.orElse(null);
    }

    @Override
    public List<Book> getAllBooks() {
        return bookDao.getAllBooks();
    }

    @Override
    public Book updateBook(Long id, Book book) {
    	logger.info(book.toString());
        Book existingBook = bookDao.getBookById(id);
        if (existingBook != null) {
            existingBook.setTitle(book.getTitle());
            existingBook.setAuthor(book.getAuthor());
            bookDao.updateBook(existingBook); // Use entityManager.merge() to update the book entity
            return existingBook;
        }
        return null;
    }


}
