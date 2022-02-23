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
        <div class="card mx-auto p-5 rounded-0">
          <span class="flex mb-4">
            <h2 class="heading">
              <c:out value="${book.title}" />
            </h2>
            <a href="/home">Back to the shelves</a>
          </span>
          <em>
            <p class="mb-0">
              <c:choose>
                <c:when test="${book.user.id == loggedUser.id}">
                  <span class="text-danger">You</span> read
                </c:when>
                <c:otherwise>
                  <span class="text-danger">
                    <c:out value="${book.user.name}" />
                  </span> read
                </c:otherwise>
              </c:choose>
              <span class="text-title">
                <c:out value="${book.title}" />
              </span>
              by
              <span class="text-author me-0">
                <c:out value="${book.author}" />
              </span>
            </p>
          </em>
          <p class="mb-4">Here are
            <c:choose>
              <c:when test="${book.user.id == loggedUser.id}">
                your thoughts:
              </c:when>
              <c:otherwise>
                <c:out value="${book.user.name}" />'s thoughts:
              </c:otherwise>
            </c:choose>
          </p>
          <div class="border-top border-bottom mx-5 p-4 mb-4">
            <p class="mb-0">
              <em>
                <c:out value="${book.thoughts}" />
              </em>
            </p>
          </div>
          <div class="d-flex justify-content-end mx-5">
            <c:if test="${book.user.id == loggedUser.id}">
              <a href="/books/${book.id}/edit" class="btn btn-warning">Edit</a>
            </c:if>
          </div>
        </div>
      </div>
</body>
</html>