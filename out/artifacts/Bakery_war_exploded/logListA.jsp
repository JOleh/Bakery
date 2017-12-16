<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logs</title>
    <style>
        td{
            border: solid black 1px;
            text-align: left;
        }
        thead{
            border: 2px;
            font-weight: bold;
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
        case 4: response.sendRedirect("productListStartPageForManager.jsp");break;
        case 5: break;
        default: response.sendRedirect("index.jsp");
    }
%>

    <div  style="width: 80%; box-sizing: border-box; border: solid black 2px; margin: 0 auto; padding: 20px">
    <div style="text-align: right">
        <form action="BackToAdmin">
        <input type="submit" value="Назад" id="back">
        </form>
    </div>
    <br>
    <table style="width: 100%; border-collapse: collapse; margin: 0 auto">
        <thead>
            <td style="width: 15%; text-align: center">User</td>
            <td style="width: 69%; text-align: center">Action</td>
            <td style="width: 16%; text-align: center">Date</td>
        </thead>
        <%
            try {
                ResultSet resultSet = DatabaseManager.getLogs((Connection)session.getAttribute("connection"));
                int i = 0;
                while(resultSet.next()){
                %>
                <tr>
                    <td>id=<%=resultSet.getInt("log.id_user")%> <%=resultSet.getString("users.name")%> <%=resultSet.getString("users.surname")%> </td>
                    <td><%=resultSet.getString("log.action")%></td>
                    <td style="text-align: center"><%=resultSet.getTimestamp("log.data")%></td>
                </tr>
                <%
                            i++;
                        }
                    } catch (Exception e) {
                    }
        %>
    </table>
    </div>
</body>
</html>
