<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="sun.misc.BASE64Encoder" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%="Product"%></title>
</head>
<body style="padding: 20px; min-width: 1200px">

<%
    if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
    if(session.getAttribute("chosen_product_id")==null) response.sendRedirect("index.jsp");
    switch((int)session.getAttribute("level")){
        case 1: break;
        case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
        case 3: break;
        case 4: break;
        case 5: break;
        default: response.sendRedirect("index.jsp");
    }
%>

<div style="width: 50%; margin: auto; padding: 20px; box-sizing: border-box; border: solid black 2px;">
    <%
        try{
            ResultSet resultSet = DatabaseManager.getProductByID((Connection)session.getAttribute("connection"), (int)session.getAttribute("chosen_product_id"));
            resultSet.next();
            byte [] image = resultSet.getBytes("image");
            BASE64Encoder base64Encoder = new BASE64Encoder();
    %>
    <div>
        <div style="margin: 0 auto; width: 100%; text-align: center">
            <img src="data:image/png;base64, <%=base64Encoder.encode(image)%>" alt="image" style="height: 300px; width: 280px">
        </div>
        <br>
        <div>
            <div style="text-align: left; float: left">
                <%=resultSet.getString("name")%>
            </div>
            <div style="text-align: right; float: right;">
                Ціна за шт. <%=resultSet.getDouble("price")%> грн.
            </div>
        </div>
        <br><br>
        <div>
            <%=resultSet.getString("info")%>
        </div>
        <br>
        <div>
            <form>
                <div style="text-align: left; float: left">
                    <input type="button" value="+" id="plus">
                    <input type="number" id="number" style="width: 40px;">
                    <input type="button" value="-" id="minus">
                </div>
                <div style="text-align: right; float: right;">
                    Ціна замовлення : <%="300"%> грн.
                </div>
            </form>
        </div>
        <br><br>
        <div>
            <form action="BackToConsumer">
            <input type="submit" value="Назад" name="back" style="float: left; text-align: left">
            </form>
            <form action="EnterFromConsumer">
            <input type="submit" value="Корзина" name="basket" style="float: right">
            </form>
        </div>
    </div>
    <%
        } catch (Exception e) {
        }
    %>
    <br>
</div>
</body>
</html>
