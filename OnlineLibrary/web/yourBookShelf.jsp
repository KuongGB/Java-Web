<%-- 
    Document   : yourBookShelf
    Created on : Jun 23, 2023, 5:42:46 PM
    Author     : Admin
--%>

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
        <div class="login-page">
            <div class="login-box">
                <%
                    String uid = (String) session.getAttribute("uid");
                    ArrayList<Integer> bidList = BookDao.getUserBookShelf(uid);
                %>
                <table border="1" class="only-font" style="border-radius: 6px;">
                    <tr><td colspan="4" class="text-center only-font-size only-font-weight" style="background-color: azure; opacity: 0.8; height: 40px">Your Book Shelf</td></tr>
                    <tr class="transparent" style="text-align: center">
                        <td style="background-color: appworkspace;">Name</td>
                        <td style="background-color: appworkspace;">Author</td>
                        <td style="background-color: appworkspace;">Category</td>
                        <td style="background-color: appworkspace;">Action</td>
                    </tr>
                    <%  
                        if(bidList.isEmpty()){
                    %>
                    <tr>
                        <td colspan="4" style="text-align: center; background-color: white; opacity: 0.8;">Empty List</td>
                    </tr>
                    <%
                        }
                    %>
                    <%
                        for (Integer id : bidList) {
                            Book b = BookDao.getBookByID(id);
                    %>
                    <form action="MainController" method="post">
                        <tr class="transparent">

                            <td style="background-color: appworkspace;">
                                <%= b.getName()%>
                                <input type="hidden" name="bid" value="<%= b.getId()%>"/>
                                <input type="hidden" name="uid" value="<%= uid%>"/>
                            </td> 
                            <td style="background-color: appworkspace;"><%= b.getAuthor()%></td>
                            <td style="background-color: appworkspace;"><%= b.getCategory()%></td>
                            <td>
                                <input type="submit" name="action" value="viewBook"/>
                            </td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    <tr><td colspan="4" class="text-center only-font-size only-font-weight"><button class="btn-a"><a href="userHome.jsp">Choose more books</a></button></td></tr>
                </table>
                
            </div>
        </div>
    </body>
</html>
