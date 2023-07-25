<%-- 
    Document   : register
    Created on : Jun 17, 2023, 5:00:56 PM
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
        <div class="login-page">
            <div class="login-box">
                <div class="login-cover">
                    <form action="MainController" method="post">
                        <table class="only-font pd">
                            <tr>
                                <td colspan="2" style="text-align: center; font-size: 24px; padding-bottom: 20px">
                                    Register
                                </td>
                            </tr>
                            <tr>
                                <td>User ID</td>
                                <td><input type="text" name="id" required=""/></td>
                            </tr>
                            <tr>
                                <td>User Name</td>
                                <td><input type="text" name="name" required=""/></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="text" name="pass" required=""/></td>
                            </tr>
                            <tr>
                                <td>Comfirm Password</td>
                                <td><input type="text" name="conPass" required=""/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><div class="msg">${msg}</div></td>
                            </tr>
                            <tr style="text-align: center; width: 100%">
                                <td colspan="2">
                                    <input style="margin-right: 20px" type="submit" name="action" value="Register"/>
                                    <button type="button" class="btn-a"><a href="login.jsp">Login</a></button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
