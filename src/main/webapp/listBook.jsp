<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.List" %>
<%@ page import="pjatk.tpo.Services.IBookServices" %>
<%@ page import="pjatk.tpo.Services.BookServices" %>
<%@ page import="pjatk.tpo.Entities.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users list</title>
    <link rel="stylesheet" href="Styles/w3.css">
</head>

<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Books library</h1>
</div>

<div class="w3-container w3-center w3-margin-bottom w3-padding">

    <div class="w3-card-4">
        <%
            PrintWriter writer = response.getWriter();
            try {
                String isbn = request.getParameter("ISBN").replaceAll("\\s","");
                String name = request.getParameter("Name").replaceAll("\\s","");
                String year = request.getParameter("Year").replaceAll("\\s","");
                String price = request.getParameter("Price").replaceAll("\\s","");
                String author = request.getParameter("Author").replaceAll("\\s","");
                String publisher = request.getParameter("Publisher").replaceAll("\\s","");

                isbn = isbn.equals("") ? "%" : String.valueOf(Integer.parseInt(isbn));
                name = name.equals("") ? "%" : name;
                year = year.equals("") ? "%" : String.valueOf(Integer.parseInt(year));
                price = price.equals("") ? "%" : String.valueOf(Integer.parseInt(price));
                author = author.equals("") ? "%" : author;
                publisher = publisher.equals("") ? "%" : publisher;

                IBookServices service = new BookServices();

                List<Book> books = (List<Book>)service.getBook(isbn, name, year, price, author, publisher);

                writer.println("<ul class=\"w3-ul\">");
                if (books.isEmpty())
                    writer.println("<li class=\"w3-hover-sand\">" + "Not found" + "</li>");
                else {
                    for (Book book : books)
                        writer.println("<li class=\"w3-hover-sand\">" + book + "</li>");
                }
                writer.println("</ul>");

            }catch (NumberFormatException e){
                writer.println("<div class=\"w3-panel w3-red w3-display-container w3-card-4 w3-round\">"
                        +
                        "   <span onclick=\"this.parentElement.style.display='none'" +
                        "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-red w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                        "   <h5>Wrong parameters!</h5>\n" +
                        "</div>");
            }catch (Exception e){
                writer.println("<div class=\"w3-panel w3-red w3-display-container w3-card-4 w3-round\">"
                        +
                        "   <span onclick=\"this.parentElement.style.display='none'" +
                        "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-red w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                        "   <h5>Database is not available. Configure database parameters at hibernate.cfg.xml or turn on your database.</h5>\n" +
                        "</div>");
            }
        %>
    </div>
</div>

<div class="w3-bar w3-padding-large w3-center-align w3-padding-24">
    <button class="w3-btn w3-green w3-round-large w3-center-align w3-margin-bottom" onclick="location.href='/find'">Back to main</button>
</div>
</body>
</html>