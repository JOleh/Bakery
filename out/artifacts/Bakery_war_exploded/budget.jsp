<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Budget</title>
    <style>
        td{
            border:solid black 1px;
        }
        thead{
            border: 2px;
            font-weight: bold;
        }
    </style>
</head>
<body style="padding: 40px; min-width: 1200px">

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

    <div style="width: 40%; margin: 0 auto; padding: 20px; box-sizing: border-box; border: solid black 2px;">
        <div style="text-align: right">
            <form action="BackToManager">
            <input type="submit" value="Назад" id="back">
            </form>
        </div>
        <br>
        <div>Бюджет : <%="300000"%> грн.</div><br><br>
        <table style="width: 100%; border-collapse: collapse; text-align: center;">
            <thead>
                <td style="width: 50%">Дата</td>
                <td style="width: 50%">Сума</td>
            </thead>
            <%
                for (int i = 0; i <8 ; i++) {
                    %>
                        <tr>
                            <td><%="21.10.2007"%></td>
                            <td><%="2000000"%> грн.</td>
                        </tr>
                    <%
                }
            %>
        </table>
    </div>
</body>
</html>
