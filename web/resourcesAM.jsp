<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
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
            try {
                ResultSet resultSet = DatabaseManager.getResources((Connection)session.getAttribute("connection"));
                int i = 0;
                while(resultSet.next()){
                    System.out.println("In resourceAM");
                %>
                    <tr>
                        <td><%=resultSet.getString("name")%></td>
                        <td><%=resultSet.getDouble("count")%> <%=resultSet.getString("value")%></td>
                    </tr>
                <%
                            i++;
                        }
                        resultSet.close();
                    } catch (Exception e) {
                    }
        %>
    </table>
</div>
</body>
</html>
