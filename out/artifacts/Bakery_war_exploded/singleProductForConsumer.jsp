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
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title><%="Product"%></title>
        <link rel="stylesheet" href="CSS/singleProductForConsumerStylesheet.css">
        <link rel="stylesheet" href="CSS/BODY.css">
    </head>
    <body>
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
        <div class="maindiv">
            <%
                try{
                    ResultSet resultSet =
                            DatabaseManager
                                    .getProductByID((Connection)session.getAttribute("connection"),
                                            (int)session.getAttribute("chosen_product_id"));
                    resultSet.next();
                    byte [] image = resultSet.getBytes("image");
                    BASE64Encoder base64Encoder = new BASE64Encoder();
            %>
            <div>
                <div class="imgdiv">
                    <img src="data:image/png;base64, <%=base64Encoder.encode(image)%>" alt="image">
                </div>
                <br>
                <div>
                    <div class="namediv">
                        <%=resultSet.getString("name")%>
                    </div>
                    <div class="pricediv">
                        Ціна за шт.
                        <%=resultSet.getDouble("price")%>
                        грн.
                    </div>
                </div>
                <br><br>
                <div>
                    <%=resultSet.getString("info")%>
                </div>
                <br>
                <div>
                    <form>
                        <div class="namediv">
                            <input type="number" id="number">
                        </div>
                        <div class="pricediv">
                            Ціна замовлення : <%="300"%> грн.
                        </div>
                    </form>
                </div>
                <br><br>
                <div>
                    <form action="BackToConsumer">
                        <input class="backbutton" type="submit" value="Назад" name="back">
                    </form>
                    <form action="EnterFromConsumer">
                        <input class="basketbutton" type="submit" value="Корзина" name="basket">
                    </form>
                </div>
            </div>
            <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <br>
        </div>
    </body>
</html>
