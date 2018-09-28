<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html >
<html>
<jsp:include page="fragments/headTag.jsp"/>
<h4>Добро пожаловать, <sec:authentication property="principal.username"/></h4>
<h1>Взносы на нужды класса</h1>
<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>N</th>
        <th>Фамилия</th>
        <th>Имя</th>
        <th>Сданная сумма</th>
        <th>Дата сдачи</th>
        <th>Метод сдачи</th>
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
            <td><a href="/students/delete/${student.id}">Удалить</a></td>
            <td><a href="/students/update/${student.id}">Редактировать</a></td>
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
<a class="btn btn-success" href="/students/create">Добавить</a>
<a class="btn btn-info" href="/expences">К списку расходов</a>

<form style="display: inline" action="/logout" method="post">
    <input class="btn btn-warning" type="submit" value="Logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>

</div>
</body>
</html>