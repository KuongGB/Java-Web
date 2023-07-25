<%-- 
    Document   : updateBook
    Created on : Jun 20, 2023, 11:35:31 PM
    Author     : Admin
--%>

<%@page import="dto.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
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
            int id = Integer.parseInt(request.getParameter("id"));
            Book b = BookDao.getBookByID(id);
            ArrayList<Category> cList = BookDao.getCateList();
        %>
        <div class="login-page">
            <div class="login-box">
                <div class="login-cover">
                    <form action="MainController" method="post">
                        <table class="only-font pd-1">
                            <tr>
                                <td colspan="2" style="text-align: center; font-size: 24px; padding-bottom: 20px">Update book</td>
                            </tr>
                            <tr>
                                <td>ID</td>
                                <td><input type="text" name="id" value="<%= id%>" readonly=""/></td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="name" value="<%= b.getName()%>" required=""/></td>
                            </tr>
                            <tr>
                                <td>Author</td>
                                <td><input type="text" name="author" value="<%= b.getAuthor()%>" required=""/></td>
                            </tr>
                            <tr>
                                <td>Category</td>
                                <td>
                                    <select name="cate">
                                    <%
                                        for(Category c : cList){
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
                                <td>
                                    <input type="text" name="img" value="<%= b.getImg()%>" required=""/>
                                </td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td>
                                    <input type="text" name="des" value="<%= b.getDes()%>"/>  
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 0;">Vip</td>
                                <td style="padding: 0;">
                                    <input type="radio" name="vip" value="true" required=""/>True
                                    <input type="radio" name="vip" value="false"/>False
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">${msg}</td>
                            </tr>
                            <tr style="text-align: center; width: 100%">
                                <td colspan="2">
                                    <button type="submit" name="action" value="updateB" style="margin-right: 20px">Update</button>
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
