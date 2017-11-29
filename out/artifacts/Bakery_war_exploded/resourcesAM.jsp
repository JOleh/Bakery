<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resources</title>
    <style>
        td{
            border:solid black 1px;
            text-align: center;
        }
        thead{
            font-weight: bold;
            border: black solid 2px;
        }
    </style>
</head>
<body style="padding: 20px; min-width: 1200px">

<%
    if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
    switch((int)session.getAttribute("level")){
        case 1: response.sendRedirect("productList.jsp");break;
        case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
        case 3: response.sendRedirect("orderingStartPageForCourier.jsp");break;
        case 4: break;
        case 5: break;
        default: response.sendRedirect("index.jsp");
    }
%>

<div  style="width: 50%; box-sizing: border-box; border: solid black 2px; margin: 0 auto; padding: 20px">
    <div style="text-align: right">
        <form action="BackToManager">
        <input type="submit" value="Назад" name="back">
        </form>
    </div>
    <br>
    <table style="width: 100%; margin: 0 auto; box-sizing: border-box; border-collapse: collapse">
        <thead>
            <td style="width: 65%">Інгрідієнт</td>
            <td style="width: 35%">Кількість</td>
        </thead>
        <%
            for (int i = 0; i <12 ; i++) {
                %>
                    <tr>
                        <td><%="Молоко"%></td>
                        <td><%="200"%> <%="л."%></td>
                    </tr>
                <%
            }
        %>
    </table>
</div>
</body>
</html>
