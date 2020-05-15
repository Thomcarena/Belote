<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page pageEncoding="UTF-8" %>
<head><title>Création Compte</title>
</head>
<body>
<%@include file="navBar.jsp"%>
    <div class="container"><h1>Bienvenue dans la création d'un compte Joueur</h1></div>
    <form action="/createJoueur" method="post" class="form-example">
        <div class="form-example">
            <label for="pseudo">Pseudo: </label>
            <input type="text" name="pseudo" id="pseudo" required>
        </div>
        <div class="form-example">
            <label for="mdp">Mot de Passe: </label>
            <input type="password" name="mdp" id="mdp" required>
        </div>
        <div class="form-example">
            <label for="age">Age: </label>
            <input type="number" name="age" id="age" required>
        </div>
        <div class="form-example">
            <label for="ville">Ville: </label>
            <input type="text" name="ville" id="ville" required>
        </div>
        <p>Choisissez votre sexe :</p>
        <div class="form-example">
            <input type="radio" name="sexe" id="H" value="H" required>
            <label for="H">H</label>
        </div>
        <div class="form-example">
            <input type="radio" name="sexe" id="F" value="F" required>
            <label for="F">F</label>
        </div>
        <div class="form-example">
            <input type="submit" value="Confirmer">
        </div>
    </form>
</body>
</html>