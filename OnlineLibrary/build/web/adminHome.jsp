<%-- 
    Document   : adminHome
    Created on : Jun 11, 2023, 2:36:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body>
        <div class="login-page login-box">
            <div class="login-cover">
                <%
                    String uname = (String)session.getAttribute("uname");
                %>
                <form action="MainController" method="post">
                    <div class="login-form">
                        <table>
                            <tr>
                                <td><p class="only-font only-font-weight" style="font-size: 26px; text-align: center;">Hello ${uname}!</p></td>
                            </tr>
                            <tr>
                                <td><div class="btn-a"><button class="only-font only-font-size text-center"  style="width: 230px"><a href="viewUser.jsp">View User List</a></button></div></td>
                            </tr>
                            <tr>
                                <td><div class="btn-a"><button class="only-font only-font-size text-center"  style="width: 230px"><a href="viewBook.jsp">View Book List</a></button></div></td>
                            </tr>
                            <tr>
                                <td><div class="btn-a"><button class="only-font only-font-size text-center"  style="width: 230px"><a href="login.jsp">Logout</a></button></div></td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
