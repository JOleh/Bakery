<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 16.12.2017
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Додати</title>
</head>
<body style="padding: 40px; min-width: 1200px">
    <div style="width: 40%; border: solid 2px black; padding: 20px; margin: 0 auto; box-sizing: border-box;">
        <div style="text-align: right">
            <form action="BackToWorker">
                <input type="submit" value="Назад" id="back">
            </form>
        </div><br>
        <div style="width: 100%; text-align: center">
        Введіть назву ресурсу :<br>
        <input type="text" style="width: 60%;" name="resourcename"><br>
        Введіть одиниці :<br>
        <input type="text" style="width: 60%;" name="value"><br>
        Введіть ціну за одиницю продукції :<br>
        <input type="number" style="width: 60%" name="price"><br>
        Введіть кількість продукції :<br>
        <input type="number" style="width: 60%;" name="count">
        </div><br>
        <form action="SaveNewResource">
        <input type="submit" name="save" value="Зберегти">
        </form>
    </div>
</body>
</html>
