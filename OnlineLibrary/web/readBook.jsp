<%-- 
    Document   : readBook.jsp
    Created on : Jun 22, 2023, 4:34:46 PM
    Author     : Admin
--%>

<%@page import="dao.BookDao"%>
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
        <%
            int bid = Integer.parseInt(request.getParameter("bid"));
            String uid = request.getParameter("uid");
            boolean status = BookDao.getStatusInBookShelf(bid, uid);
            Book b = BookDao.getBookByID(bid);
        %>
        <form action="MainController" method="post">
            <div class="b-box" style="width: 1400px">
                <div class="b-box-left">
                    <div><img id="box" src="img-library/<%= b.getImg()%>"></div>
                    <input type="hidden" name="uid" value="<%= uid%>"/>
                    <input type="hidden" name="bid" value="<%= bid%>"/>
                </div>
                <div class="b-box-right" style="display: flex; align-items: center; justify-content: center">
                    <div style="height: 70%">
                        <div class="only-font only-font-weight" style="color: darkgreen; font-size: 40px"><%= b.getName()%></div>
                        <div class="only-font" style="color: #006666; font-size: 30px"><%= b.getAuthor()%></div>
                        <div class="only-font" style="color: cadetblue; font-size: 30px">Category: <%= b.getCategory()%></div>
                        <div class="only-font" style="color: chartreuse; font-size: 25px">Status: <%= status?"Finished":"Reading"%></div>
                        <div style="width: 100%; height: 50%; display: flex; justify-content: center; margin-bottom: 20px">
                            <div class="only-font" style="margin: 15px 0; padding-left: 15px; text-align: left; color: black; font-size: 20px; height: 100%; width: 400px; border: solid 1px burlywood; border-radius: 20px; opacity: 0.7; background-color: darkgray; float: inside"><%= b.getDes()%></div>
                        </div>
                        <div style="margin-bottom: 40px">
                            <button type="submit" name="action" value="finishB" class="only-font">Mark as finished</button>
                            <button class="btn-a only-font"><a href="userHome.jsp">Choose more books</a></button>
                        </div>
                    </div>
                </div>
            </div>     
        </form>
        
    </body>
</html>
