<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 01.11.2017
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <style>
        .headerTitle{
            text-align: center;
            height: 80px;
            font-size: 60px;
            border-bottom: solid black 1px;
        }
    </style>
</head>
<body style="padding: 20px; min-width: 1200px">

<div style="width: 40%; margin: 0 auto; border: solid black 2px; padding: 30px; box-sizing: border-box">
    <div class="headerTitle">Реєстрація</div>
    <div style="padding-top: 30px">
        <form action="Registration" method="get">
            Ім'я<br>
            <input type="text" name="name" placeholder="Введіть Ім'я" required><br><br>
            Прізвище<br>
            <input type="text" name="surname" placeholder="Введіть прізвище" required><br><br>
            Номер телефону<br>
            <input type="tel" name="phonenumber" placeholder="+(111) 22 3333333"  >  <%=request.getAttribute("m_phone")!=null?request.getAttribute("m_phone"):" "%><br><br>
            Email<br>
            <input type="email" name="email" placeholder="Введіть email" required>  <%=request.getAttribute("m_email")!=null?request.getAttribute("m_email"):" "%><br><br>
            Пароль<br>
            <input type="password" name="password" placeholder="Введіть пароль" required minlength="8" maxlength="16"><br><br>
            Повторіть пароль<br>
            <input type="password" name="checkPassword" placeholder="Введіть пароль" required minlength="8" maxlength="16">  <%=request.getAttribute("m_pass")!=null?request.getAttribute("m_pass"):" "%>
            <br><br>

            <input type="submit" value="Зареєструватись"><%%>
            <br><br>
            <a href="index.jsp">Увійти</a>
        </form>
    </div>
</div>
</body>
</html>
