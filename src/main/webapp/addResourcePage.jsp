<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 16.12.2017
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Додати</title>
    </head>
    <body>
        <div class="maindiv">
            <div class="exitdiv">
                <form action="BackToWorker">
                    <input type="submit" value="Назад" id="back">
                </form>
            </div>
            <br>
            <div class="resourcediv">
                Введіть назву ресурсу :
                <br>
                <input type="text" name="resourcename">
                <br>
                Введіть одиниці :
                <br>
                <input type="text"  name="value">
                <br>
                Введіть ціну за одиницю продукції :
                <br>
                <input type="number"  name="price">
                <br>
                Введіть кількість продукції :
                <br>
                <input type="number"  name="count">
            </div>
            <br>
            <form action="SaveNewResource">
                <input type="submit" name="save" value="Зберегти">
            </form>
        </div>
    </body>
</html>
