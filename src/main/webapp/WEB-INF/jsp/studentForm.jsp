<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<div class="container">
    <form action="/students" method="post">
        <input type="hidden" name="id" value="${student.id}">
        <div class="form-group">
            <label for="lastname">Фамилия :</label>
            <input class="form-control" id="lastname" type="text" name="lastname" value="${student.lastname}">
        </div>
        <div class="form-group">
            <label for="firstname">Имя :</label>
            <input class="form-control" id="firstname" type="text" name="firstname" value="${student.firstname}">
        </div>
        <div class="form-group">
            <label for="amount">Сумма :</label>
            <input class="form-control" id="amount" type="number" name="amount" value="${student.amount}">
        </div>
        <div class="form-group">
            <label for="date">Дата :</label>
            <input class="form-control" id="date" type="date" name="date" value="${student.date}">
        </div>
        <div class="form-group">
            <label for="transferMethod">Как передали:</label>
            <input class="form-control" id="transferMethod" type="text" name="transferMethod"
                   value="${student.transferMethod}">
        </div>
        <div class="form-group">
            <input class="btn btn-success" type="submit" value="Добавить">
            <button class="btn btn-danger" onclick="window.history.back()" type="button">Отменить</button>
        </div>
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>
</div>
</body>
</html>