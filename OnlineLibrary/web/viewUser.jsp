<%-- 
    Document   : viewUser
    Created on : Jun 15, 2023, 5:27:47 PM
    Author     : Admin
--%>

<%@page import="dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body>
        <div class="login-page" style="background-color: beige">
            <div class="login-box">
            <table border="2" class="only-font" style="border-radius: 6px;">
                <tr>
                    <td colspan="6" class="text-center only-font-size only-font-weight" style="background-color: azure; opacity: 0.8; height: 40px">User List</td> 
                </tr>
                <tr class="transparent">
                    <td style="background-color: appworkspace">User ID</td>
                    <td style="background-color: appworkspace">User Name</td>
                    <td style="background-color: appworkspace">Password</td>
                    <td style="background-color: appworkspace">Role</td>
                    <td style="background-color: appworkspace">Vip</td>
                    <td style="background-color: appworkspace">Action</td>
                </tr>
                <%
                    ArrayList<User> uList = new ArrayList<>();
                    uList = UserDao.getUserList();
                    for (User u : uList) {
                %>
                        <form action="MainController" method="post">
                            <tr class="transparent">
                                <td><input type="text" name="id" value="<%= u.getUid()%>" readonly=""/></td>
                                <td><input type="text" name="name" value="<%= u.getFullname()%>" required=""/></td>
                                <td><input type="text" name="pwd" value="<%= u.getPass()%>" required=""/></td>
                                <td><input type="text" name="role" value="<%= u.getRole()%>" readonly=""/></td>
                                <td><input type="text" name="vip" value="<%= u.isVip()%>" required=""/></td>
                                <td>
                                    <button type="submit" name="action" value="updateU">Update</button>
                                    <button type="submit" name="action" value="deleteU">Delete</button>
                                </td>
                            </tr>
                        </form>
                <%
                    }
                %>
                <tr>
                    <td colspan="6" class="text-center only-font-size only-font-weight" ><div class="msg only-font" style="font-size: 15px; color: yellow">${msg}</div>
                    <div class="btn-a only-font"><button><a href="adminHome.jsp">Back Home</a></button></div></td> 
                </tr>
            </table>
            </div>
        </div>
    </body>
</html>
