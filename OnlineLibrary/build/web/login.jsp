<%-- 
    Document   : login
    Created on : Jun 15, 2023, 4:20:48 PM
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
                        <div class="login-form">
                            <table>
                                <tr><td colspan="2" style="text-align: center; font-size: 24px; padding-bottom: 20px"><div>Online Library</div></td><td></td></tr>
                                <tr>
                                    <td class="login-text">User ID</td><td><input type="text" name="uid"></td>
                                </tr>
                                <tr><td class="login-text">Password</td><td><input type="password" name="pass"></td></tr>
                                <tr class="msg" ><td style="width: 180px">${errorMsg} ${msg}</td><td style="text-align: right"><a href="register.jsp" style="text-decoration: none;color: green">Register Now</a></td></tr>
                            </table>
                        </div>
                        <div class="login-btn"><input type="submit" value="Login" name="action"></div>
                    </form>
                </div>
            </div> 
        </div>                    
    </body>
</html>
