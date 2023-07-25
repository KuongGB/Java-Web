<%-- 
    Document   : viewBook.jsp
    Created on : Jun 15, 2023, 5:27:28 PM
    Author     : Admin
--%>

<%@page import="dao.BookDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
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
                <table border="1" class="only-font" style="border-radius: 6px;">
                    <tr>
                        <td colspan="8" class="text-center only-font-size only-font-weight" style="background-color: azure; opacity: 0.8; height: 40px">Book List</td> 
                    </tr>
                    <tr class="transparent">
                        <td style="background-color: appworkspace; width: 50px">ID</td>
                        <td style="background-color: appworkspace; width: 250px">Name</td>
                        <td style="background-color: appworkspace">Author</td>
                        <td style="background-color: appworkspace">Category</td>
                        <td style="background-color: appworkspace; width: 100px">Image Path</td>
                        <td style="background-color: appworkspace">Description</td>
                        <td style="background-color: appworkspace; width: 50px">Vip</td>
                        <td style="background-color: appworkspace">Action</td>
                    </tr>
                    <%
                        ArrayList<Book> bList = new ArrayList<>();
                        bList = BookDao.getBookList();
                        for (Book b : bList) {
                    %>
                            <form action="MainController" method="post">
                                <tr class="transparent">
                                    <td><input style="width: 50px" type="text" name="id" value="<%= b.getId()%>" readonly=""/></td>
                                    <td><input style="width: 250px" type="text" name="name" value="<%= b.getName()%>" readonly=""/></td>
                                    <td><input type="text" name="author" value="<%= b.getAuthor()%>" readonly=""/></td>
                                    <td><input type="text" name="cate" value="<%= b.getCategory()%>" readonly=""/></td>
                                    <td><input style="width: 100px" type="text" name="img" value="<%= b.getImg()%>" readonly=""/></td>
                                    <td><input style="width: 250px" type="text" name="des" value="<%= b.getDes()%>" readonly=""/></td>
                                    <td><input style="width: 50px" type="text" name="vip" value="<%= b.isVip()%>" readonly=""/></td>
                                    <td>
                                        <button class="btn-a"><a href="updateBook.jsp?id=<%= b.getId()%>">Update</a></button>
                                        <button type="submit" name="action" value="deleteB">Delete</button>
                                    </td>
                                </tr>
                            </form>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="8" class="text-center only-font-size only-font-weight" ><div class="msg only-font" style="font-size: 15px; color: yellow">${msg}</div>
                            <div class="btn-a only-font">
                                <button><a href="insertBook.jsp">Insert New Book</a></button>
                                <button><a href="adminHome.jsp">Back Home</a></button>
                            </div>
                        </td> 
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
