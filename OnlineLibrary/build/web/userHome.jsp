<%-- 
    Document   : userHome
    Created on : Jun 11, 2023, 2:35:50 PM
    Author     : Admin
--%>

<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.BookDao"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
    </head>
    <body class="user-page">

        <header class="only-font">
            <nav>
                <%
                    String key = (String) request.getAttribute("key");
                    String type = (String) request.getAttribute("type");
                    if (key == null) {
                        key = "";
                    }
                    if (type == null) {
                        type = "books.name";
                    }
                    ArrayList<Book> bList = BookDao.searchBook(key, type);
                    String uid = (String) session.getAttribute("uid");
                    String msg = request.getParameter("msg");
                %>
                <ul>
                    <li style="width: 10%"><a href=""><img id="logo" src="img-library/logo.jpg"></a></li>
                    <li style="text-align: left; width: 15%; display: flex; justify-content: flex-start; align-items: center"><a class="only-font-weight" style="font-size: 25px; display: flex;" href="#">On<div style="font-family: monospace;">Book</div></a></li>
                    <li style="width: 30%; display: flex; justify-content: center; align-items: center">
                        <form action="MainController" method="post">
                            <input type="text" name="key"/>
                            <select class="only-font" name="type">
                                <option class="only-font" value="books.name">Name</option>
                                <option class="only-font" value="author">Author</option>
                            </select>
                            <button name="action" value="searchB">Search</button>
                        </form>
                    </li>
                    <li style="width: 200px; height: 80px; display: flex; align-items: center; margin-left: auto"><a href="MainController?action=viewBS">View my bookshelf</a></li>
                    <li style="height: 80px; display: flex; align-items: center; margin-left: auto"><a href="MainController?action=vipCon">Become a vip</a></li>
                    <li style="height: 80px; display: flex; align-items: center; margin-left: auto"><a href="login.jsp">Logout</a></li>
                </ul>
            </nav>
        </header>
        <section style="padding-top: 20px; padding-bottom: 90px">
            <div class="msg only-font">${msg}</div>
            <%
                for (Book b : bList) {
            %>
            <div class="b-card">
                    <a href="MainController?action=viewBook&&bid=<%= b.getId()%>&&uid=<%= uid%>">
                        <img id="card" src="img-library/<%= b.getImg()%>">
                        <div class="only-font"><%= b.getName()%></div>
                    </a>        

            </div>
            <%
                }
            %>
        </section>
        <!--        <footer>
                    <div class="footer only-font" >Copyright &copy; <span class="only-font only-font-size" style="display: flex;">On<div style="font-family: monospace;">Book</div>. BOOk IS THE BEST.</span></div>
                </footer>-->
        <footer class="footer">
            <div class="waves">
                <div class="wave" id="wave1"></div>
                <div class="wave" id="wave2"></div>
                <div class="wave" id="wave3"></div>
                <div class="wave" id="wave4"></div>
            </div>
            <ul class="social-icon">
                <li class="social-icon__item"><a class="social-icon__link" href="#">
                        <ion-icon name="logo-facebook"></ion-icon>
                    </a></li>
                <li class="social-icon__item"><a class="social-icon__link" href="#">
                        <ion-icon name="logo-twitter"></ion-icon>
                    </a></li>
                <li class="social-icon__item"><a class="social-icon__link" href="#">
                        <ion-icon name="logo-linkedin"></ion-icon>
                    </a></li>
                <li class="social-icon__item"><a class="social-icon__link" href="#">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a></li>
            </ul>

            <p>&copy;2023 Online Library | All Rights Reserved</p>
        </footer>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
