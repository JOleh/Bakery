<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.11.2017
  Time: 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resources</title>
    <link rel="stylesheet" href="CSS/startPageForWorker.css">
</head>
<body>

<%
    if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
    switch((int)session.getAttribute("level")){
        case 1: response.sendRedirect("productList.jsp");break;
        case 2: break;
        case 3: response.sendRedirect("orderingStartPageForCourier.jsp");break;
        case 4: response.sendRedirect("productListStartPageForManager.jsp");break;
        case 5: response.sendRedirect("workerListStartPageForAdmin");break;
        default: response.sendRedirect("index.jsp");
    }
%>

<div class="headerTitle"><%=session.getAttribute("nameP")%></div>
<div class="contactInfo">
    <div class="exit">
        <form action="ExitConsumerAccount">
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
<div class="resources">
    <table>
        <thead>
            <td style="width: 60%">Інгредієнт</td>
            <td style="width: 15%; text-align: center">Кількість</td>
            <td style="width: 15%; text-align: center">Ціна за шт./л./кг.</td>
        </thead>
        <%
            try {
                ResultSet resultSet = DatabaseManager.getResources((Connection)session.getAttribute("connection"));
                while(resultSet.next()){
                    if(resultSet.getBoolean("active")){
                %>
                    <tr>
                        <td style="border:solid black 1px"><%=resultSet.getString("name")%></td>
                        <td style="border:solid black 1px; text-align: center"><input type="text" id="count" value="<%=resultSet.getString("count")%>" style="width: 30px">
                            <input type="text" id="show" value="<%=resultSet.getString("value")%>"  style="width: 30px"></td>
                        <td style="border:solid black 1px; text-align: center"><input type="text" id="price" value="<%=resultSet.getString("price")%>"  style="width: 30px"> грн.</td>
                        <td>
                            <form action="DeleteResource">
                            <input type="submit" value="Видалити" name="delete<%=resultSet.getInt("id")%>">
                            </form>
                        </td>
                    </tr>
                <%
                        }
                }
                    } catch (Exception e) {
                    }
        %>
    </table>
    <br>
    <form action="addResourcePage.jsp">
    <input type="submit" id="add" value="Додати">
    </form>
</div>
<div class="navigation">
    <%=session.getAttribute("name")%> <%=session.getAttribute("surname")%><br><br>
    <form action="EnterFromWorker">
        <input type="submit" name="supplyList" value="Список поставок" style="width: 80%; text-align: center"><br>
        <input type="submit" name="orderList" value="Список замовлень продукції" style="width: 80%; text-align: center"><br>
        <input type="submit" name="order" value="Замовити" style="width: 80%; text-align: center"><br>

    </form>
</div>
</body>
</html>
