<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="sun.misc.BASE64Encoder" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title><%="Product"%></title>
        <link rel="stylesheet" href="CSS/singleProductAMStylesheet.css">
    </head>
    <body>

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

        <div class="maindiv">
            <%

                if(session.getAttribute("chosen_product_id")!=null){
                try{
                    ResultSet resultSet =
                            DatabaseManager
                                    .getProductByID((Connection)session.getAttribute("connection"),
                                            (int)session.getAttribute("chosen_product_id"));
                    resultSet.next();
                    byte [] image = resultSet.getBytes("image");
                    BASE64Encoder base64Encoder = new BASE64Encoder();
            %>
            <div class="imgdiv">

                <div class="loadfileimg" onclick="FindFile();" title="Загрузка файла">
                    <input type="image" src="data:image/png;base64, <%=base64Encoder.encode(image)%>"  name="img">
                </div>

                <form target="rFrame" method="POST" enctype="multipart/form-data">
                    <div class="loaddiv">
                        <input type="file" id="my_hidden_file" accept="image/png" name="loadfile" onchange="LoadFile();">
                        <input type="submit" id="my_hidden_load" class="load" value='Загрузить'>
                    </div></form>
                <iframe id="rFrame" name="rFrame"> </iframe>

                <script src="upload.js"> </script>
            </div>
            <br>
            <div class="namediv">
                <input type="text" name="name" value="<%=resultSet.getString("name")%>">
            </div>
            <div class="pricediv">
                Ціна :
                <input type="text" name="price" value="<%=resultSet.getDouble("price")%>">
                грн.
            </div>
            <br><br>
            <div>
                <textarea rows="6" placeholder="<%=resultSet.getString("info")%>" contenteditable="true">
                </textarea>
            </div>
            <br>
            <div class="ingredientdiv">
                Інгрідієнти :
                <table>
                    <%
                        ResultSet resultSet1 = DatabaseManager
                                .getProductIngredient((Connection)session.getAttribute("connection"),
                                        (int)session.getAttribute("chosen_product_id"));
                        while(resultSet1.next()){
                    %>
                    <tr>
                        <td>
                            <%=resultSet1.getString("name")%>
                        </td>
                        <td><input type="text" id="iCount" value="<%=resultSet1.getDouble("count")%>">
                            <%=resultSet1.getString("value")%>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
            <br><br>
            <div class="OKbutton">
                <form action="SaveEditedProduct">
                    <input type="submit" id="ok" value="OK">
                </form>
                <form action="singleProductAM.jsp">
                    <input type="submit" id="cancel" value="Cancel">
                </form>
            </div>
            <div class="backbutton">
                <form action="BackToManager">
                    <input type="submit" name="back" value="Назад">
                </form>
            </div>
            <br><br><br>
            <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </body>
</html>
