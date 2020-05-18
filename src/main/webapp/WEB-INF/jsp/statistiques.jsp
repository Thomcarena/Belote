<%@ page import="com.example.Belote.POJO.Joueur" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: thoma
  Date: 17/05/2020
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Belote - Statistiques</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
</head>
<body id="fond">
<%@include file="navBar.jsp"%>
<h1> Statistiques des joueurs</h1>
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">Pseudo</th>
        <th scope="col">nb Partie Jouées</th>
        <th scope="col">nb Victoires</th>
        <th scope="col">nb Moyen Victoires</th>
        <th scope="col">Score Moyen</th>
    </tr>
    </thead>
    <tbody>
    <% List<Joueur> joueurs = (List<Joueur>) request.getAttribute("listeJoueurs");
        for(int i =0; i < joueurs.size(); i++){
            out.print("<tr><th scope=\"row\">");
            out.print(joueurs.get(i).getPseudoJ());
            out.print("</th>");
            out.print("<td>"+joueurs.get(i).getNbPartieJ()+"</td>");
            out.print("<td>"+joueurs.get(i).getNbVictoireJ()+"</td>");
            out.print("<td>"+joueurs.get(i).getNbMoyenneJ()+"</td>");
            out.print("<td>"+joueurs.get(i).getScoreMoyenJ()+"</td>");
            out.print("</tr>");
        }%>
    </tbody>
</table>
</body>
</html>
