package com.jeremy.login_and_reg.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeremy.login_and_reg.models.Book;
import com.jeremy.login_and_reg.repo.BookRepo;

@Service
public class BookService {
	@Autowired
	private BookRepo bookRepo;
	
	// Get All
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	
	// Create One
	public Book createBook(Book b) {
		return bookRepo.save(b);
	}
	
	//Find One
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	
	//Update One
	public Book updateBook(Book book) {
		Optional<Book> optionalBook = bookRepo.findById(book.getId());
        if (optionalBook.isPresent()) {
            return bookRepo.save(book);
        } else
            return null;
	}
	
	//Delete One
	public void deleteBook(Long id) {
        bookRepo.deleteById(id);
    }
}
