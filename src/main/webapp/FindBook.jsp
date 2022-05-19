<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find book</title>
    <link rel="stylesheet" href="Styles/w3.css">
</head>

<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-right-align">
    <h1>Books library</h1>
</div>

<div class="w3-container w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2>Find a book</h2>
        </div>
        <form method="post" class="w3-selection w3-light-grey w3-padding">
            <label>ISBN:
                <input type="text" name="ISBN" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <label>Name:
                <input type="text" name="Name" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <label>Year:
                <input type="text" name="Year" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <label>Price:
                <input type="text" name="Price" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <label>Author:
                <input type="text" name="Author" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <label>Publisher:
                <input type="text" name="Publisher" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Submit</button>
        </form>
    </div>
</div>
</body>
</html>