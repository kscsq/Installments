<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<div class="container">
    <h4>Добро пожаловать, <sec:authentication property="principal.username"/></h4>

    <h1>Список расходов</h1>

    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>N</th>
            <th>Расход</th>
            <th>Сумма</th>
            <th>Дата</th>
            <th class="d-none d-xl-table-cell">Тип</th>
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
                <td class="text-right"><fmt:formatNumber value="${expence.amount}" type="number" maxFractionDigits="0"/></td>
                <td>${expence.date}</td>
                <td class="d-none d-xl-table-cell">${expence.type}</td>
                <td>${expence.responsiblePerson}</td>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <td><a href="/expences/delete/${expence.id}">Удалить</a></td>
                    <td><a href="/expences/update/${expence.id}">Редактировать</a></td>
                </sec:authorize>
            </tr>
        </c:forEach>
        <tr>
            <td></td>
            <td>Итого :</td>
            <td class="text-right"><fmt:formatNumber value="${total}" maxFractionDigits="0"/></td>
        </tr>
        </tbody>

    </table>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a class="btn btn-success" href="/expences/create">Добавить расход</a>
    </sec:authorize>
    <a class="btn btn-info" href="/students">К списку класса</a>
    <form style="display: inline" action="/logout" method="post">
        <input class="btn btn-warning" type="submit" value="Logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>

</div>
</body>
</html>