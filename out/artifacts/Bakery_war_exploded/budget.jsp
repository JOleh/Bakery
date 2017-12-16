<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
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
        <%
            try{
                ResultSet resultSet = DatabaseManager.getBudget((Connection)session.getAttribute("connection"));
                int i = 0;
                resultSet.next();
        %>
        <br>
        <div>Бюджет : <%=resultSet.getDouble("budget")%> грн.</div><br><br>
        <table style="width: 100%; border-collapse: collapse; text-align: center;">
            <thead>
                <td style="width: 50%">Дата</td>
                <td style="width: 50%">Сума</td>
            </thead>
            <%
                do{
                    %>
                        <tr>
                            <td><%=resultSet.getTimestamp("recording_date")%></td>
                            <td><%=resultSet.getDouble("budget")%> грн.</td>
                        </tr>
                    <%
                                i++;
                            }while(resultSet.next());
                resultSet.close();
                        } catch (Exception e) {
                        }
            %>
        </table>
    </div>
</body>
</html>
