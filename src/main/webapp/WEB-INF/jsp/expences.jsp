<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="fragments/headTag.jsp"/>

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
            <td><a href="/expences/delete/${expence.id}">Удалить</a></td>
            <td><a href="/expences/update/${expence.id}">Редактировать</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td></td>
        <td>Итого :</td>
        <td>${total}</td>
    </tr>
    </tbody>

</table>
<a class="btn btn-success" href="/expences/create">Добавить расход</a>

<a class="btn btn-info" href="/students">К списку класса</a>
</div>
</body>
</html>