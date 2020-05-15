<%--
  Created by IntelliJ IDEA.
  User: thoma
  Date: 15/05/2020
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container"><h1>Connexion</h1></div>
<form action="/verifConnexion" method="get" class="form-example">
    <div class="form-example">
        <label for="pseudo">Pseudo: </label>
        <input type="text" name="pseudo" id="pseudo" required>
    </div>
    <div class="form-example">
        <label for="mdp">Mot de Passe: </label>
        <input type="password" name="mdp" id="mdp" required>
    </div>
    <div class="form-example">
        <input type="submit" value="Confirmer">
    </div>
</form>
</body>
</html>
