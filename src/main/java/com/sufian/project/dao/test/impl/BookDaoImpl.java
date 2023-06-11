package com.sufian.project.dao.test.impl;

import java.util.List;

import javax.persistence.*;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.sufian.project.dao.test.BookDao;
import com.sufian.project.entity.test.Book;

@Repository
@Transactional
public class BookDaoImpl implements BookDao {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Book> getAllBooks() {
        String query = "SELECT b FROM Book b";
        return entityManager.createQuery(query, Book.class).getResultList();
    }

    @Override
    public Book getBookById(Long id) {
        return entityManager.find(Book.class, id);
    }

    @Override
    public void createBook(Book book) {
        entityManager.persist(book);
    }

    @Override
    public void updateBook(Book book) {
        entityManager.merge(book);
    }

    @Override
    public void deleteBook(Long id) {
        Book book = entityManager.find(Book.class, id);
        if (book != null) {
            entityManager.remove(book);
        }
    }
}

