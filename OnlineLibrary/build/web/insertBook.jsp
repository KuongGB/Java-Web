<%-- 
    Document   : insertBook
    Created on : Jun 22, 2023, 1:20:15 PM
    Author     : Admin
--%>

<%@page import="dto.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BookDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body>
        <%
            ArrayList<Category> cList = BookDao.getCateList();
        %>
        <div class="login-page">
            <div class="login-box">
                <div class="login-cover">
                    <form action="MainController" method="post">
                        <table class="only-font pd">
                            <tr>
                                <td colspan="2" class="only-font-weight text-center">Insert Book</td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="name" required=""/></td>
                            </tr>
                            <tr>
                                <td>Author</td>
                                <td><input type="text" name="author" required=""/></td>
                            </tr>
                            <tr>
                                <td>Category</td>
                                <td>
                                    <select name="cate" class="only-font">
                                        <%
                                            for (Category c : cList) {
                                        %>
                                        <option value="<%= c.getId()%>">
                                            <%= c.getName()%>
                                        </option>    
                                        <%
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Image Path</td>
                                <td><input type="text" name="img" required=""/></td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td><input type="text" name="des"/></td>
                            </tr>
                            <tr>
                                <td style="padding: 0;">Vip</td>
                                <td style="padding: 0;">
                                    <input type="radio" name="vip" value="true" required=""/>True
                                    <input type="radio" name="vip" value="false"/>False
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><div>${msg}</div></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <button type="submit" name="action" value="insertB">Insert</button>
                                    <button type="button" class="btn-a"><a href="viewBook.jsp">Comeback</a></button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div> 
    </body>
</html>
