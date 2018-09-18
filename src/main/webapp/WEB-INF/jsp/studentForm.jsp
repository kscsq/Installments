<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Добавить / изменить ученика</title>
</head>
<body>
<form action="/students" method="post">
    <table>
        <tr>
            <td>Фамилия :</td>
            <td><input type="text" name="lastname" value="${student.lastname}">
            </td>
        </tr>
        <tr>
            <td>Имя :</td>
            <td><input type="text" name="firstname">
            </td>
        </tr>
        <tr>
            <td>Сумма :</td>
            <td><input type="number" name="amount"></td>
        </tr>
        <tr>
            <td>Дата :</td>
            <td><input type="date" name="date"></td>
        </tr>
        <tr>
            <td>Как передали:</td>
            <td>
                <input type="text" name="transferMethod">
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Добавить"></td>
            <td>
                <button onclick="window.history.back()" type="button">Отменить</button>
            </td>

        </tr>
    </table>
</form>
</body>
</html>