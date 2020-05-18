<%@ page import="com.example.Belote.POJO.Joueur" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: thoma
  Date: 18/05/2020
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Belote - Partie</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%@include file="navBar.jsp"%>
    <% List<Joueur> joueurs = (List<Joueur>) request.getAttribute("listeJoueurs");%>

<h1>Création d'une partie</h1>
<label>Liste des joueurs</label>
<p>Joueur 1 : <%=session.getAttribute("pseudo")%></p>
<p>Joueur 2 :
    <form action="/partie" method="post" class="form-example">
        <select class="form-control" id="J2" name="J2">
                <%for(int i =0; i < joueurs.size(); i++){
                    out.print("<option value=\""+joueurs.get(i).getPseudoJ()+"\">"+joueurs.get(i).getPseudoJ()+"</option>");
                }%>
        </select></p>
    <p>Joueur 3 :
        <select class="form-control" id="J3" name="J3">
            <%for(int i =0; i < joueurs.size(); i++){
                out.print("<option value=\""+joueurs.get(i).getPseudoJ()+"\">"+joueurs.get(i).getPseudoJ()+"</option>");
            }%>
        </select></p>
    <p>Joueur 4 :
        <select class="form-control" id="J4" name="J4">
            <%for(int i =0; i < joueurs.size(); i++){
                out.print("<option value=\""+joueurs.get(i).getPseudoJ()+"\">"+joueurs.get(i).getPseudoJ()+"</option>");
            }%>
        </select></p>
        <input type="submit" value="Commencer la partie">
    </form>
</body>
</html>
