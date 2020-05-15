<%--
  Created by IntelliJ IDEA.
  User: thoma
  Date: 15/05/2020
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Belote - Compte</title>
</head>
<body>
<%@include file="navBar.jsp"%>
<div class="container"><h1>Modifier votre compte</h1></div>
<p>Pseudo : <%=session.getAttribute("pseudo")%></p>
<form action="/modifierCompte" method="post" class="form-example">
    <div class="form-example">
        <label for="mdp">Mot de Passe:  </label>
        <input type="password" name="mdp" id="mdp" value="<%=session.getAttribute("mdp")%>" required>
    </div>
    <div class="form-example">
        <label for="age">Age: </label>
        <input type="number" name="age" id="age" value ="<%=session.getAttribute("age")%>" required>
    </div>
    <div class="form-example">
        <label for="ville">Ville: </label>
        <input type="text" name="ville" id="ville"  value="<%=session.getAttribute("ville")%>" required>
    </div>
    <p>Choisissez votre sexe : (Actuel : <%=session.getAttribute("sexe")%>)</p>
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
