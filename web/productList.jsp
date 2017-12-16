<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.11.2017
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=session.getAttribute("nameP")%></title>
    <link rel="stylesheet" href="CSS/productListStylesheet.css">
</head>
<body>


<%
    if(session.getAttribute("level")==null) response.sendRedirect("index.jsp");
    switch((int)session.getAttribute("level")){
        case 1: break;
        case 2: response.sendRedirect("resourcesStartPageForWorker.jsp");break;
        case 3: break;
        case 4: break;
        case 5: break;
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
<form action="ProductOrder" id="form">
<div class="products">
    <table>

            <%
                ArrayList<Integer> idList = new ArrayList<>();
                try {
                    ResultSet resultSet = DatabaseManager.getProductsOnScreen((Connection)session.getAttribute("connection"));
                    int temporary = 0;
                    int i = 0;
                    while(resultSet.next()){
                        idList.add(resultSet.getInt("id"));
                        if(i-temporary==3){
                    %>
        </tr> <%
        }
        if(i%3==0){
            temporary = i;
    %>
        <tr>
            <%
                }
            %>
            <td style="box-sizing: border-box; padding: 10px; text-align: center">
                <%
                    byte [] image = resultSet.getBytes("image");
                    BASE64Encoder base64Encoder = new BASE64Encoder();
                %>
                <div class="name">
                <%=resultSet.getString("name")%><br>
                </div >

                <a href="OpenSingleProduct?productlink=<%=resultSet.getInt("id")%>" name="productlink">
                    <img src="data:image/png;base64, <%=base64Encoder.encode(image)%>" alt="image" style="width: 280px; height: 300px; ">
                </a>
                <br><br>

                <div class="plusminus">

                    <%--<form action="ProductOrder" id="form<%=resultSet.getInt("id")%>">--%>
                    <input type="number" name="<%=resultSet.getInt("id")%>" min="0" max="10000" style="float:left;width: 40px">
                   <%-- </form>--%>

                </div>
                <div class="price">
                    <%=resultSet.getDouble("price")%>грн.
                </div>
            </td>
            <%
                        i++;
            }
            resultSet.close();
            } catch (Exception e) {
            }
            %></tr>
    </table>
</div>
<div class="navigation">
    <%=session.getAttribute("name")%> <%=session.getAttribute("surname")%><br><br>
    <%--<%

        for (Integer i : idList) {
            System.out.println("loop "+i);
            %>
    <script>
                addForm(<%=i%>);
    </script>
            <%
        }

    %>--%>

        <input type="submit" value="Корзина" name="basket" style="width: 80%; text-align: center" onclick="submitForms()"><br>

    <form action="EnterFromConsumer">
        <input type="submit" value="Історія замовлень" name="history" style="width: 80%; text-align: center">
    </form>
    <%--<script>
        submitForms = function() {

            $('#').find('#form13:input').not(':submit').clone().hide().appendTo('#form');

            document.getElementById("form").submit();
        };
    </script>
    <SCRIPT>
        var addForm = function (i){
            str = 'form'+i.toString();
            $('#').find('#'+str+':input').not(':submit').clone().hide().appendTo('#form');
            //$('#form :input').not(':submit').clone().hide().appendTo('#form');
        }
    </SCRIPT>--%>
</div>
</form>
</body>
</html>
