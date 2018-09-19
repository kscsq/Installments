<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%--<head>--%>
<%--<title>Expences</title>--%>
<jsp:include page="fragments/headTag.jsp"/>
</head>
<body>
<div class="container">
    <h1>Список расходов</h1>

    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>N</th>
            <th>Расход</th>
            <th>Сумма</th>
            <th>Дата</th>
            <th>Тип</th>
            <th>Ответственный</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="index" value="0" scope="page"/>
        <c:forEach items="${expences}" var="expence">
            <c:set var="index" value="${index + 1}" scope="page"/>
            <tr>
                <td>${index}</td>
                <td>${expence.name}</td>
                <td>${expence.amount}</td>
                <td>${expence.date}</td>
                <td>${expence.type}</td>
                <td>${expence.responsiblePerson}</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

    <button onclick="window.history.back()" type="button">Назад</button>
</div>
</body>
</html>