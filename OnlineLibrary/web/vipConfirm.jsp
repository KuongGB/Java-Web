<%-- 
    Document   : vipConfirm
    Created on : Jun 25, 2023, 3:22:09 PM
    Author     : Admin
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body>
        <div class="login-page only-font">
            <div class="login-box">
                <form class="bill" action="MainController" method="post">
                    <%
                        LocalDateTime now = LocalDateTime.now();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                        String dateNow = now.format(formatter);
                    %>
                    <div class="bill-name only-font only-font-size only-font-weight" style="margin: 20px 0;">Your bill</div>
                    <div class="bill-feature">Date:<div class="bill-feature-value"><%= dateNow%></div></div>
                    <div class="bill-feature">Customer:<div class="bill-feature-value">${uname}</div></div>
                    <div class="bill-feature">Saler:<div class="bill-feature-value">OnLibrary</div></div>
                    <div class="bill-name">---------------------------------------------------</div>
                    <div class="bill-feature">Name service<div class="bill-feature-value">Cost</div></div>
                    <div class="bill-feature">Become Vip<div class="bill-feature-value">59.000VND</div></div>
                    <div class="bill-name">---------------------------------------------------</div>
                    <div class="bill-feature" style="margin-bottom: 25px">Total cost:<div class="bill-feature-value">59.000VND</div></div>
                    <div class="bill-btn">
                        <button name="action" value="confirmBill" onclick="alert('Welcome to Vip World')">Confirm</button>
                        <button class="btn-a"><a href="userHome.jsp">May be later</a></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
