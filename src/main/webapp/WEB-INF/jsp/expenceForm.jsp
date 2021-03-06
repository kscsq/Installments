<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<div class="container">
    <form action="/expences" method="post">
        <input type="hidden" name="id" value="${expence.id}">
        <div class="form-group">
            <label for="name">Расход :</label>
            <input class="form-control" id="name" type="text" name="name" value="${expence.name}">
        </div>
        <div class="form-group">
            <label for="amount">Сумма :</label>
            <input class="form-control" id="amount" type="number" name="amount" value="${expence.amount}">
        </div>
        <div class="form-group">
            <label for="date">Дата :</label>
            <input class="form-control" id="date" type="date" name="date" value="${expence.date}">
        </div>
        <div class="form-group">
            <label for="type">Тип :</label>
            <input class="form-control" id="type" type="text" name="type" value="${expence.type}">
        </div>
        <div class="form-group">
            <label for="responsiblePerson">Ответственный :</label>
            <input class="form-control" id="responsiblePerson" type="text" name="responsiblePerson"
                   value="${expence.responsiblePerson}">
        </div>
        <input class="btn btn-success" type="submit" value="Добавить">
        <button class="btn btn-danger" onclick="window.history.back()" type="button">Отменить</button>
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
    </form>

</div>
</body>
</html>