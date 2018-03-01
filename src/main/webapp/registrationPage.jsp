<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 01.11.2017
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Registration</title>
        <link rel="stylesheet" href="CSS/BODY.css">
        <link rel="stylesheet" href="CSS/registrationStylesheet.css">

        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.2.1/jquery.js"></script>    <%-- https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>--%>
        <%--<script type="text/javascript" src="plugins/jquery.maskedinput.min.js"></script>--%>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery-maskedinput/1.3.1/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="registrationScript.js"></script>

    </head>
    <body>
        <div class="maindiv">
            <div class="headerTitle">
                Реєстрація
            </div>
            <div class="filllist">
                <%--<form action="Registration" method="post">--%>
                    Ім'я
                    <br>
                    <input type="text" name="name" id="name" placeholder="Введіть Ім'я" required>
                    <br><br>
                    Прізвище
                    <br>
                    <input type="text" name="surname" id="surname" placeholder="Введіть прізвище" required>
                    <br><br>
                    Номер телефону<br>
                    <input type="tel" name="phonenumber" id="phonenumber"
                           placeholder="Введіть номер телефону"  required>
                    <div class="error" id="phone_msg"></div>
                    <br>
                    Email
                    <br>
                    <input type="email" name="email" id="email" placeholder="Введіть email">
                    <div class="error" id="email_msg"></div>
                    <br>
                    Пароль
                    <br>
                    <input type="password" name="password" id="pass1"
                           placeholder="Введіть пароль" required minlength="8" maxlength="16">
                    <div id="pass1_msg"></div>
                    <br>
                    Повторіть пароль
                    <br>
                    <input type="password" name="checkPassword" id="pass2"
                           placeholder="Введіть пароль" required minlength="8" maxlength="16">
                    <div class="error" id="pass2_msg"></div>
                    <br>
                    <input type="button" id="submit" value="Зареєструватись">
                    <br>
                    <div id="submit_msg"></div>
                    <br>
                    <a href="index.jsp">Увійти</a>
                <%--</form>--%>
            </div>
        </div>
    </body>
</html>
