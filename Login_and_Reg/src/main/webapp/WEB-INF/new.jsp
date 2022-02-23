<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Login & Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mx-auto p-5">
            <div class="card form-card mx-auto p-4 rounded-0">
              <h2 class="mb-3">Add a Book to Your Shelf</h2>
              <form:form action="/books/new" method="POST" modelAttribute="book">
                <div class="mb-3">
                  <form:label path="title" for="formInput" class="form-label">Title</form:label>
                  <form:errors path="title" class="text-danger" />
                  <form:input type="text" class="form-control" id="formInput" path="title" />
                </div>
                <div class="mb-3">
                  <form:label path="author" for="formInput" class="form-label">Author
                  </form:label>
                  <form:errors path="author" class="text-danger" />
                  <form:input type="text" class="form-control" id="formInput" path="author" />
                </div>
                <div class="mb-3">
                  <form:label path="thoughts" for="formControlTextarea" class="form-label">My Thoughts
                  </form:label>
                  <form:errors path="thoughts" class="text-danger" />
                  <form:textarea type="text" class="form-control" id="formControlTextarea" path="thoughts" row="4" />
                </div>
                <div class="flex">
                  <a href="/books">Back to the shelves</a>
                  <span class="flex gap-3 buttons">
                    <a href="/home" class="btn btn-secondary">
                      Cancel
                    </a>
                    <input type="submit" value="Submit" class="btn btn-primary">
                  </span>
                </div>
              </form:form>
            </div>
          </div>   
</body>
</html>