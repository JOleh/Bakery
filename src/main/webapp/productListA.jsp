<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Products</title>

        <link rel="stylesheet" href="CSS/productListAStylesheet.css">
        <link rel="stylesheet" href="CSS/BODY.css">
        <link rel="stylesheet" href="CSS/EXIT.css">
    </head>
    <body>
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

        <div class="maindiv">
            <div class="exitdiv">
                <form action="BackToAdmin">
                    <input type="submit" value="Назад" name="back">
                </form>
            </div>
            <br>
            <table>
                <thead>
                    <td class="theadproducttd">
                        Продукт
                    </td>
                    <td class="theadpricetd">
                        Ціна
                    </td>
                </thead>
                <%
                    try {
                        ResultSet resultSet =
                                DatabaseManager
                                        .getProductsOnScreenNoImage((Connection)session.getAttribute("connection"));
                        while(resultSet.next()){
                            if(resultSet.getBoolean("active")){
                            System.out.println("in product (admin)");
                %>
                <tr>
                    <td class="nametd">
                        <%=resultSet.getString("name")%>
                    </td>
                    <td class="pricetd">
                        <%=resultSet.getDouble("price")%>
                        грн.
                    </td>
                    <td class="editbutton">
                        <form action="OpenProductFromAM">
                            <input type="submit" name="<%=resultSet.getInt("id")%>" value="Редагувати">
                        </form>
                    </td>
                    <td class="deletebutton">
                        <form action="DeleteProduct">
                            <input type="submit" name="delete<%=resultSet.getInt("id")%>" value="Видалити">
                        </form>
                    </td>
                </tr>
                <%
                            }
                        }
                        resultSet.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <br>
            <div>
                <form action="EnterFromAdmin">
                    <input type="submit" name="add" value="Додати продукцію">
                </form>
            </div>
        </div>
    </body>
</html>
