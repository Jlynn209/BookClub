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
   <!-- Enter body here -->
        <div class="container p-5">
          <div class="card mx-auto p-4 rounded-0">
            <div class="flex mb-3">
              <div>
                <h1 class="mb-3">Welcome,
                  <c:out value="${loggedUser.name}" />!
                </h1>
                <p class="mb-4">Books from everyone's shelves:</p>
              </div>
              <div class="text-end">
                <form action="/logout" method="POST">
                  <button class="border-0 bg-transparent text-primary mb-3">Logout</button>
                </form>
                <a href="/books/new" class="mb-4">+ Add a book to my shelf</a>
              </div>
            </div>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Title</th>
                  <th scope="col">Author</th>
                  <th scope="col">Posted By</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="book" items="${books}">
                  <tr>
                    <td>
                      <c:out value="${book.id}" />
                    </td>
                    <td><a href="/books/${book.id}">
                        <c:out value="${book.title}" />
                      </a></td>
                    <td>
                      <c:out value="${book.author}" />
                    </td>
                    <td>
                      <c:out value="${book.user.name}" />
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>

</body>
</html>