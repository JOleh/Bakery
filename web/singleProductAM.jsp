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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%="Product"%></title>
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

<div  style="width: 50%; margin: 0 auto; padding: 20px; border: solid black 2px;">
    <%

        if(session.getAttribute("chosen_product_id")!=null){
        try{
            ResultSet resultSet = DatabaseManager.getProductByID((Connection)session.getAttribute("connection"), (int)session.getAttribute("chosen_product_id"));
            resultSet.next();
            byte [] image = resultSet.getBytes("image");
            BASE64Encoder base64Encoder = new BASE64Encoder();
    %>
    <div style="text-align: center">

        <div class="navButtons" onclick="FindFile();" title="Загрузка файла">
            <input type="image" src="data:image/png;base64, <%=base64Encoder.encode(image)%>"  name="img" style="width: 280px; height: 300px;border: 0">
        </div>

        <form target="rFrame" method="POST" enctype="multipart/form-data">
            <div style="position:absolute;
                        overflow: hidden;
                        display:block;
                        height:0;
                        width:0;">
                <input type="file"   id="my_hidden_file" accept="image/png" name="loadfile" onchange="LoadFile();">
                <input type="submit" id="my_hidden_load" style="display: none" value='Загрузить'>
            </div></form>
        <iframe id="rFrame" name="rFrame" style="display: none"> </iframe>

        <script src="upload.js"> </script>

        <%--<div class="navButtons"  >
            <img src="buttons/openfile.png"   width=100% height=100%/>
            </a></div>--%>

      <!--  <form action="upload.php" enctype="multipart/form-data" target="rFrame">
            <div class="hiddenInput">
                <input type="file" name="loadfile" accept="image/png" style="overflow: hidden" onchange="LoadFile();">
                <input type="image" src="data:image/png;base64, <%=base64Encoder.encode(image)%>" alt="Submit" name="submit" style="width: 280px; height: 300px;border: 0" onclick="getFile">
            </div>
        </form>
        <iframe id="rFrame" name="rFrame" style="display: none"> </iframe>-->
    </div>
    <br>
    <div style="float: left; width: 50%"><input type="text" name="name" value="<%=resultSet.getString("name")%>"></div>
    <div style="float: left; width: 50%; text-align: right">Ціна : <input type="text" name="price" value="<%=resultSet.getDouble("price")%>" style="width: 50px"> грн.</div>
    <br><br>
    <div>
        <textarea rows="6" style="width: 100%;" placeholder="<%=resultSet.getString("info")%>" contenteditable="true"></textarea>
    </div>
    <br>
    <div style="padding-left: 5%">
        Інгрідієнти :
        <table style="width: 100%; margin: 0 auto; box-sizing: border-box; border-collapse: collapse">
            <%
                ResultSet resultSet1 = DatabaseManager.getProductIngredient((Connection)session.getAttribute("connection"), (int)session.getAttribute("chosen_product_id"));
                while(resultSet1.next()){
                    System.out.println("in singleProd(am)");
            %>
            <tr>
                <td><%=resultSet1.getString("name")%></td>
                <%
                    System.out.println("after res.name");
                %>
                <td><input type="text" id="iCount" style="width: 50px" value="<%=resultSet1.getDouble("count")%>"> <%=resultSet1.getString("value")%> </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <br><br>
    <div style="float: left ; width: 70%">
        <form action="SaveEditedProduct">
            <input type="submit" id="ok" value="OK">
        </form>
        <form action="singleProductAM.jsp">
            <input type="submit" id="cancel" value="Cancel">
        </form>
    </div>
    <div style="float: left; width: 30%; text-align: right">
        <form action="BackToManager">
        <input type="submit" name="back" value="Назад">
        </form>
    </div>
    <br><br><br>
    <%
            } catch (Exception e) {
            }
        }
    %>
</div>
</body>
</html>
