<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>
<body>
<div class="container">

    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>Last Name</th>
            <th>First Name</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Method</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.lastname}</td>
                <td>${student.firstname}</td>
                <td>${student.amount}</td>
                <td>${student.date}</td>
                <td>${student.transferMethod}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>