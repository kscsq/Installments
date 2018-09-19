<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<jsp:include page="fragments/headTag.jsp"/>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <%--<title>Взносы на нужды класса</title>--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
          <%--integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"--%>
          <%--crossorigin="anonymous">--%>
<%--</head>--%>
</head>
<body>
<div class="container">

    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>N</th>
            <th>Last Name</th>
            <th>First Name</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Method</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="index" value="0" scope="page"/>
        <c:forEach items="${students}" var="student">
            <c:set var="index" value="${index + 1}" scope="page"/>
            <tr>
                <td>${index}</td>
                <td>${student.lastname}</td>
                <td>${student.firstname}</td>
                <td>${student.amount}</td>
                <td>${student.date}</td>
                <td>${student.transferMethod}</td>
                <td><a href="/students/delete/${student.id}">Delete</a></td>
                <td><a href="/students/update/${student.id}">Update</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td></td>
            <td></td>
            <td>Итого :</td>
            <td>${total}</td>
        </tr>
        </tbody>
    </table>
    <a href="/students/create">Добавить</a>
    <br>
    <a href="/expences">Расходы</a>


</div>
</body>
</html>