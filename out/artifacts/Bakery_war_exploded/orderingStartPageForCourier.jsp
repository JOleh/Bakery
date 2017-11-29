<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=session.getAttribute("nameP")%></title>
    <link rel="stylesheet" href="CSS/startPageForCourier.css">
</head>
<body>

<%
    if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
    switch((int)session.getAttribute("level")){
        case 1: response.sendRedirect("productList.jsp");break;
        case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
        case 3: break;
        case 4: response.sendRedirect("productListStartPageForManager.jsp");break;
        case 5: response.sendRedirect("workerListStartPageForAdmin");break;
        default: response.sendRedirect("index.jsp");
    }
%>

<div class="headerTitle"><%=session.getAttribute("nameP")%></div>
<div class="contactInfo">
    <div class="exit">
        <form action="ExitAdminAccount">
            <input type="submit" value="Вихід">
        </form>
    </div>
    <div class="info">
        Телефон : <br>
        <%=session.getAttribute("phoneP")%><br>
        Email : <br>
        <%=session.getAttribute("emailP")%>
    </div>
</div>
<div style="padding: 20px; border:solid black 2px; box-sizing: border-box; margin: 0 auto; float: left; width: 100%; border-top: hidden">
    <div style="width: 80%; text-align: center; margin: 0 auto;">
        <div><%=session.getAttribute("name")%> <%=session.getAttribute("surname")%></div>
        <div style="text-align: left; width: 50%">
            <form action="EnterFromCourier">
            <input type="submit" name="userRegime" value="Режим покупця">
            </form>
        </div>
        <div style="text-align: right; width: 50%; float: left">
            <input type="button" id="confirm" value="Підтвердити">
        </div>
        <br>
   <table style="text-align: center">
       <thead>
            <td style="width: 20%;">Номер телефону</td>
            <td style="width: 50%;">Адреса</td>
            <td style="width: 10%;">Відмовити</td>
            <td style="width: 10%;">Отримати</td>
            <td style="width: 10%;">Виконано</td>
       </thead>
       <%
           for (int i = 0; i <4 ; i++) {
               %>
                    <tr>
                        <td><%="+3806721593"%></td>
                        <td><%="м.Львів вул.Лазаренка 42"%></td>
                        <td><input type="checkbox" id="ifRefused"></td>
                        <td><input type="checkbox" id="ifGet"></td>
                        <td><input type="checkbox" id="ifDone"></td>
                    </tr>
                <%
           }
       %>

   </table>
    </div>

</div>
</body>
</html>
