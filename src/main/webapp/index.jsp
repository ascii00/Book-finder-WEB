<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Books library</title>
    <link rel="stylesheet" href="Styles/w3.css">
</head>
    <body class="w3-light-grey">
    <div class="w3-container w3-blue-grey w3-opacity w3-right-align">
        <h1>Books library</h1>
    </div>

    <div class="w3-container w3-center">
        <div class="w3-bar w3-padding-large w3-padding-24">
            <button class="w3-btn w3-green w3-round-large" onclick="location.href='/find'">Find a book</button>
        </div>
    </div>
    <div class="w3-container w3-grey w3-opacity w3-left-align w3-padding">
        <div class="w3-bar w3-padding-large w3-padding-24">
            <li> On the next page you can find the book in the database -
             BOOK {ISBN PK, Name, RealiseYear, Price, AuthorID FK, PublisherID FK} - Author {ID PK, Name} - Publisher {ID PK, Name}.</li>
            <li> You can search for a book by several parameters at the same time.</li>
            <li> Click "Find abook" button and enter search parameters.</li>
        </div>
    </div>

</body>
</html>