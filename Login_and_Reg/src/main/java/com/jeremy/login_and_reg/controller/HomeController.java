package com.jeremy.login_and_reg.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.jeremy.login_and_reg.models.Book;
import com.jeremy.login_and_reg.models.User;
import com.jeremy.login_and_reg.services.BookService;
import com.jeremy.login_and_reg.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BookService bookService;
	
	// Home page, to display all books
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
			User loggedUser = userService.findUser(user.getId());
			List<Book> books = bookService.allBooks();
			model.addAttribute("loggedUser", loggedUser);
			model.addAttribute("books", books);
			return "welcome.jsp";
		} else {
			return "redirect:/";
		}
	}
	
	// Create a new book
	@GetMapping("/books/new")
	public String createBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
        if (user != null) {
        	User loggedUser = userService.findUser(user.getId());
            model.addAttribute("loggedUser", loggedUser);
            return "new.jsp";           
        } else {       	
        	return "redirect:/";
        }
	}
	
    // submit new book
    @PostMapping("/books/new")
    public String submitBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model, HttpSession session) {
    	User user = (User) session.getAttribute("user");
        if (result.hasErrors()) {
        	User loggedUser = userService.findUser(user.getId());
            model.addAttribute("loggedUser", loggedUser);
            return "new.jsp";
        } else {
            User loggedUser = userService.findUser(user.getId());
            model.addAttribute("loggedUser", loggedUser);
            book.setUser(loggedUser);
            bookService.createBook(book);
            return "redirect:/home";
        }
    }
	
    // Get One
    @GetMapping("/books/{id}")
    public String viewBook(@PathVariable("id") Long id, Model model, HttpSession session) {
    	User user = (User) session.getAttribute("user");
        if (user != null) {
        	User loggedUser = userService.findUser(user.getId());
            model.addAttribute("loggedUser", loggedUser);
            Book book = bookService.findBook(id);
            model.addAttribute("book", book);
            return "viewone.jsp";
        } else {
            return "redirect:/";
        }
    }
	
	@PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
	
	// Update One
    @GetMapping("/books/{id}/edit")
    public String editBook(@PathVariable("id") Long id, Model model, HttpSession session) {
    	User user = (User) session.getAttribute("user");
        if (user != null) {
            Book book = bookService.findBook(id);
            model.addAttribute("book", book);
            model.addAttribute("users", userService.allUsers());
            return "edit.jsp";
        } else {
            return "redirect:/";
        }
    }
    
    // Submit Update
    @PutMapping("/books/{id}/edit")
    public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {
        if (result.hasErrors()) {
            Book editedBook = bookService.findBook(book.getId());
            book.setTitle(editedBook.getTitle());
            List<User> users = userService.allUsers();
            model.addAttribute("users", users);
            return "edit.jsp";
        } else {
            bookService.updateBook(book);
            return "redirect:/books/{id}";
        }
    }
    // Delete One
    @DeleteMapping("/books/{id}/delete")
    public String deleteBook(@PathVariable("id") Long id) {
        bookService.deleteBook(id);
        return "redirect:/home";
    }
}
