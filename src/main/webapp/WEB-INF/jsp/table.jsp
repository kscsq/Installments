<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<div class="container">
    <h4>Добро пожаловать, <sec:authentication property="principal.username"/></h4>
    <h1>Взносы на нужды класса</h1>
    <div class="row">
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>N</th>
                <th>Фамилия</th>
                <th>Имя</th>
                <th>Сданная сумма</th>
                <th class="d-none d-xl-table-cell">Дата сдачи</th>
                <th class="d-none d-xl-table-cell">Метод сдачи</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="index" value="0" scope="page"/>
            <c:forEach items="${students}" var="student">
                <c:set var="index" value="${index + 1}" scope="page"/>
                <tr class="${student.amount == 0 ? 'table-danger' : student.amount < 10000 ? 'table-warning' : 'table-success'}">
                    <td>${index}</td>
                    <td>${student.lastname}</td>
                    <td>${student.firstname}</td>
                    <td class="text-right"><fmt:formatNumber value="${student.amount}" maxFractionDigits="0"/></td>
                    <td class="d-none d-xl-table-cell">${student.date}</td>
                    <td class="d-none d-xl-table-cell">${student.transferMethod}</td>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <td><a href="/students/delete/${student.id}">Удалить</a></td>
                        <td><a href="/students/update/${student.id}">Редактировать</a></td>
                    </sec:authorize>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td>Итого :</td>
                <td class="text-right"><fmt:formatNumber value="${total}" maxFractionDigits="0"/></td>
            </tr>
            </tbody>
        </table>
    </div>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a class="btn btn-success" href="/students/create">Добавить</a>
    </sec:authorize>
    <a class="btn btn-info" href="/expences">К списку расходов</a>

    <form style="display: inline" action="/logout" method="post">
        <input class="btn btn-warning" type="submit" value="Logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>

</div>
</body>
</html>