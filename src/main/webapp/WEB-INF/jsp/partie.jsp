<%--
  Created by IntelliJ IDEA.
  User: thoma
  Date: 18/05/2020
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Belote - Partie</title>
</head>
<body>
<!--JS -->
<script>
    var couleur = ["S", "H", "D", "C"];
    var valeur = ["A", "7", "8", "9", "10", "J", "Q", "K"];
    var premiereDistribution = true;
    var atout;
    var valeurJouee;
    var couleurJouee;
    var pointJouee;
    var nbTours=0;
    var isDernierPliCache=true;
    var joueurGagnant;
    var aPris;
    var compteurPli=0;
    var scoreEq1 = 0;
    var scoreEq2 = 0;
    var compteurManche=0;



    class joueur{
        cartes=[];
        nom;
        premier=false;
        carteJouee;
        points=0;
        distribue=false;
        belote=false;
        rebelote=false;
        beloteRebelote=false;

        joue(){
            var aJoue = false;
            var plusFort = false;
            var positionMeilleureCarte=0;
            if(this.premier){
                var r=Math.floor(Math.random() * Math.floor(8))
                valeurJouee= this.cartes[r].Valeur;
                couleurJouee= this.cartes[r].Couleur;
                if(couleurJouee == atout){
                    pointJouee = this.cartes[r].PointsAtout;
                }
                else{
                    pointJouee = this.cartes[r].Points;
                }
                console.log(valeurJouee+" "+couleurJouee);
            }
            var meilleureCarte = null;
            for(var j=0; j<this.cartes.length; j++){
                if(this.cartes[j].Jouable){
                    meilleureCarte=this.cartes[j];
                    positionMeilleureCarte=j;
                    break;
                }
            }

            //Vérifie si un joueur à belote et rebelote (Dame et roi d'atout)
            for(var j=0; j<this.cartes.length; j++){
                if(!this.beloteRebelote) {
                    if (this.cartes[j].Valeur == "Q" && this.cartes[j].Couleur == atout) {
                        this.belote = true;
                    } else if (this.cartes[j].Valeur == "K" && this.cartes[j].Couleur == atout) {
                        this.rebelote = true;
                    }
                    if (this.belote && this.rebelote) {
                        this.beloteRebelote = true;
                        console.log("J'ai belote et rebelote");
                    }
                }
            }

            for (var i in this.cartes){
                if(this.cartes[i].Jouable){
                    console.log(i);
                    if(couleurJouee == atout){ //Si l'atout est demandé
                        if(this.cartes[i].Couleur == couleurJouee){ //Si le joueur a de l'atout
                            console.log("J'ai de l'atout");
                            if(this.cartes[i].PointsAtout > pointJouee){ //Si le joueur a une meilleure carte à l'atout
                                if(meilleureCarte.Couleur==atout){
                                    if(this.cartes[i].PointsAtout>=meilleureCarte.PointsAtout){ //Si le joueur a une meilleure carte
                                        meilleureCarte= this.cartes[i];
                                        console.log("atout plus fort");
                                        console.log("Meilleure carte :"+meilleureCarte.Valeur+" "+meilleureCarte.Couleur);
                                        aJoue=true;
                                        plusFort=true;
                                        positionMeilleureCarte = i;
                                    }
                                }
                                else{ //Mon atout est plus fort que mes autres cartes
                                    meilleureCarte= this.cartes[i];
                                    console.log("atout plus fort");
                                    console.log("Meilleure carte :"+meilleureCarte.Valeur+" "+meilleureCarte.Couleur);
                                    aJoue=true;
                                    plusFort=true;
                                    positionMeilleureCarte = i;
                                }
                            }
                            else{ //S'il a une carte inférieure à celle jouée
                                if(meilleureCarte.Couleur==atout) {
                                    if(!plusFort){
                                        if (this.cartes[i].PointsAtout <= meilleureCarte.PointsAtout) { //Si le joueur a une meilleure carte
                                            meilleureCarte = this.cartes[i];
                                            console.log("atout moins fort");
                                            console.log("Meilleure carte :" + meilleureCarte.Valeur + " " + meilleureCarte.Couleur);
                                            aJoue = true;
                                            positionMeilleureCarte = i;
                                        }
                                    }
                                }
                                else{
                                    meilleureCarte = this.cartes[i];
                                    console.log("atout moins fort");
                                    console.log("Meilleure carte :" + meilleureCarte.Valeur + " " + meilleureCarte.Couleur);
                                    aJoue = true;
                                    positionMeilleureCarte = i;
                                }
                            }
                        }
                        else{// S'il a pas d'atout
                            console.log("J'ai pas d'atout");
                            if(this.cartes[i].Points<meilleureCarte.Points && !aJoue){ //carte la plus faible si il a pas d'atout
                                meilleureCarte= this.cartes[i];
                                console.log("carte la plus faible");
                                console.log("Meilleure carte :"+meilleureCarte.Valeur+" "+meilleureCarte.Couleur);
                                positionMeilleureCarte = i;
                            }
                        }
                    }
                    else{//Si la carte jouée n'est pas un atout
                        if(this.cartes[i].Couleur == couleurJouee){
                            console.log("J'ai la couleur demandée");
                            meilleureCarte = this.cartes[i];
                            positionMeilleureCarte = i;
                        }
                        else if(this.cartes[i].Couleur == atout){
                            console.log("j'ai pas la couleur demandée mais j'ai atout");
                            if(meilleureCarte.Couleur != couleurJouee){
                                if(meilleureCarte.Couleur == atout){
                                    if(this.cartes[i].PointsAtout >= meilleureCarte.PointsAtout){
                                        meilleureCarte = this.cartes[i];
                                        positionMeilleureCarte = i;
                                        console.log("je joue mon meilleur atout");
                                    }
                                }
                                else{
                                    meilleureCarte = this.cartes[i];
                                    positionMeilleureCarte = i;
                                    console.log("je joue un atout au pif");
                                }
                            }
                        }
                        else{
                            if(meilleureCarte.Couleur != atout && meilleureCarte.Couleur != couleurJouee){
                                if(this.cartes[i].Points <= meilleureCarte.Points){
                                    meilleureCarte = this.cartes[i];
                                    positionMeilleureCarte = i;
                                    console.log("j'ai pas d'atout j'ai pas la couleur demandée");
                                }
                            }
                        }
                    }
                }
            }
            //Cas de la belote rebelote
            if(this.beloteRebelote){
                if((meilleureCarte.Valeur == "Q" || meilleureCarte.Valeur == "K") && meilleureCarte.Couleur == atout){
                    if(this.belote){
                        console.log("BELOTE !!!!!!!!!!!");
                        document.getElementById("beloteRebelote").textContent=this.nom+" : BELOTE !!!";
                        this.belote=false;
                    }
                    else if(this.rebelote){
                        console.log("REBELOTE !!!!!!!!!");
                        document.getElementById("beloteRebelote").textContent=this.nom+" : REBELOTE !!!";
                        this.rebelote=false;
                    }
                }
            }

            console.log("Meilleure carte que je vais jouer :"+meilleureCarte.Valeur+" "+meilleureCarte.Couleur);
            addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+meilleureCarte.Valeur+meilleureCarte.Couleur+".png",this.nom+"joue");
            //console.log(this.nom+"c"+positionMeilleureCarte-nbTours);
            positionMeilleureCarte++;
            addCards("",this.nom+"c"+String(positionMeilleureCarte));
            console.log("Carte suppr :"+this.nom+"c"+String(positionMeilleureCarte));
            annulerCarte(this,positionMeilleureCarte-1);
            this.carteJouee=meilleureCarte;
        }
    }
    var j1 = new joueur();
    var j2 = new joueur();
    var j3 = new joueur();
    var j4 = new joueur();

    j1.premier=true;
    j1.nom="J1";
    j2.nom="J2";
    j3.nom="J3";
    j4.nom="J4";
    j4.distribue=true;


    function gagnant(){
        var valeurj1;
        var valeurj2;
        var valeurj3;
        var valeurj4;
        //Définition de la valeur de la carte dans le contexte du pli
        //J1
        if(j1.carteJouee.Couleur==atout){
            valeurj1 = j1.carteJouee.PointsAtout +30;
        }
        else if(j1.carteJouee.Couleur==couleurJouee){
            valeurj1 = j1.carteJouee.Points +15;
        }
        else{
            valeurj1 = j1.carteJouee.Points;
        }
        if(j1.carteJouee.Valeur=="8"){
            valeurj1 = valeurj1 - 1;
        }
        if(j1.carteJouee.Valeur=="7"){
            valeurj1 = valeurj1 - 2;
        }
        //J2
        if(j2.carteJouee.Couleur==atout){
            valeurj2 = j2.carteJouee.PointsAtout +30;
        }
        else if(j2.carteJouee.Couleur==couleurJouee){
            valeurj2 = j2.carteJouee.Points +15;
        }
        else{
            valeurj2 = j2.carteJouee.Points;
        }
        if(j2.carteJouee.Valeur=="8"){
            valeurj2 = valeurj2 - 1;
        }
        if(j2.carteJouee.Valeur=="7"){
            valeurj2 = valeurj2 - 2;
        }
        //J3
        if(j3.carteJouee.Couleur==atout){
            valeurj3 = j3.carteJouee.PointsAtout +30;
        }
        else if(j3.carteJouee.Couleur==couleurJouee){
            valeurj3 = j3.carteJouee.Points +15;
        }
        else{
            valeurj3 = j3.carteJouee.Points;
        }
        if(j3.carteJouee.Valeur=="8"){
            valeurj3 = valeurj3 - 1;
        }
        if(j3.carteJouee.Valeur=="7"){
            valeurj3 = valeurj3 - 2;
        }
        //J4
        if(j4.carteJouee.Couleur==atout){
            valeurj4 = j4.carteJouee.PointsAtout +30;
        }
        else if(j4.carteJouee.Couleur==couleurJouee){
            valeurj4 = j4.carteJouee.Points +15;
        }
        else{
            valeurj4 = j4.carteJouee.Points;
        }
        if(j4.carteJouee.Valeur=="8"){
            valeurj4 = valeurj4 - 1;
        }
        if(j4.carteJouee.Valeur=="7"){
            valeurj4 = valeurj4 - 2;
        }
        //Comparaison des valeurs des cartes pour obtenir le gagnant du pli
        //J1 gagnant
        if(valeurj1 > valeurj2 && valeurj1 > valeurj3 && valeurj1 > valeurj4){
            joueurGagnant=j1;
            j1.premier=true;
            j2.premier=false;
            j3.premier=false;
            j4.premier=false;

        }
        //J2 gagnant
        if(valeurj2 > valeurj1 && valeurj2 > valeurj3 && valeurj2 > valeurj4){
            joueurGagnant=j2;
            j1.premier=false;
            j2.premier=true;
            j3.premier=false;
            j4.premier=false;
        }
        //J3 gagnant
        if(valeurj3 > valeurj1 && valeurj3 > valeurj2 && valeurj3 > valeurj4){
            joueurGagnant=j3;
            j1.premier=false;
            j2.premier=false;
            j3.premier=true;
            j4.premier=false;
        }
        //J4 gagnant
        if(valeurj4 > valeurj1 && valeurj4 > valeurj2 && valeurj4 > valeurj3){
            joueurGagnant=j4;
            j1.premier=false;
            j2.premier=false;
            j3.premier=false;
            j4.premier=true;
        }
        console.log("Valeur des cartes : J1:"+valeurj1+" J2: "+valeurj2+" J3: "+valeurj3+" J4: "+valeurj4)
        console.log(joueurGagnant.nom);
    }

    function distribuer() {

        document.getElementById("distribuerButton").style.visibility="hidden"; //Cache le bouton distribuer
        if(j4.distribue){
            document.getElementById("prendreB").style.visibility="visible"; //Montre le bouton prendre atout
            document.getElementById("pasPrendreB").style.visibility="visible"; //Montre le bouton ne pas prendre atout
        }

        //Création du paquet
        deck = getDeck();
        shuffle(deck);

       for(var i=0; i<deck.length; i++){
           if(premiereDistribution) {
               if(i<5){
                   j1.cartes.push(deck[i]);
                   addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J1c" + String(i + 1));
               }
               else if(i < 10){
                   j2.cartes.push(deck[i]);
                   //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i+1-5));
                   addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J2c"+String(i+1-5));
               }
               else if(i<15){
                   j3.cartes.push(deck[i]);
                   //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i+1-10));
                   addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J3c"+String(i+1-10));
               }
               else if(i<20){
                   j4.cartes.push(deck[i]);
                   //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i+1-15));
                   addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J4c"+String(i+1-15));
               }
               addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","J1joue");
           }
       }
       if(j1.distribue){
           prendreRobot();
           if(aPris=="j2" || aPris=="j3" || aPris=="j4"){
               jouerRobot();
           }
           else{
               document.getElementById("prendreB").style.visibility="visible"; //Montre le bouton prendre atout
               document.getElementById("pasPrendreB").style.visibility="visible"; //Montre le bouton ne pas prendre atout
           }
       }
       if(j3.distribue){
           prendreRobot();
           if(aPris=="j2" || aPris=="j3" || aPris=="j4"){
               jouerRobot();
           }
           else{
               document.getElementById("prendreB").style.visibility="visible"; //Montre le bouton prendre atout
               document.getElementById("pasPrendreB").style.visibility="visible"; //Montre le bouton ne pas prendre atout
           }
       }
       if(j2.distribue){
           prendreRobot();
           if(aPris=="j2" || aPris=="j3" || aPris=="j4"){
               jouerRobot();
           }
           else{
               document.getElementById("prendreB").style.visibility="visible"; //Montre le bouton prendre atout
               document.getElementById("pasPrendreB").style.visibility="visible"; //Montre le bouton ne pas prendre atout
           }
       }
    }

    function getDeck()
    {
        var deck = new Array();
        var points = 0;
        var pointsAtout = 0;

        for(var i = 0; i < couleur.length; i++)
        {
            for(var x = 0; x < valeur.length; x++)
            {
                if(valeur[x]==="A") {
                    points = 11;
                    pointsAtout = 11;
                }
                if(valeur[x]==="K") {
                    points = 4;
                    pointsAtout = 4;
                }
                if(valeur[x]==="Q") {
                    points = 3;
                    pointsAtout = 3;
                }
                if(valeur[x]==="J") {
                    points = 2;
                    pointsAtout = 20;
                }
                if(valeur[x]==="10") {
                    points = 10;
                    pointsAtout = 10;
                }
                if(valeur[x]==="9") {
                    points = 0;
                    pointsAtout = 14;
                }
                if(valeur[x]==="8" || valeur[x]==="7") {
                    points = 0;
                    pointsAtout = 0;
                }
                var card = {Valeur: valeur[x], Couleur: couleur[i], Points : points, PointsAtout : pointsAtout, Jouable : true };
                deck.push(card);
            }
        }

        return deck;
    }
    function shuffle(deck)
    {
        // for 1000 turns
        // switch the values of two random cards
        for (var i = 0; i < 1000; i++)
        {
            var location1 = Math.floor((Math.random() * deck.length));
            var location2 = Math.floor((Math.random() * deck.length));
            var tmp = deck[location1];

            deck[location1] = deck[location2];
            deck[location2] = tmp;
        }
    }

    function addCards(carte, joueur){
        var carteJoueur = document.getElementById(joueur);
        console.log(joueur);
        carteJoueur.src=carte;
    }

    function prendreRobot(){
        aPris="";
        var nombre = Math.floor(Math.random() * Math.floor(3))+2; // Donne : 2, 3 ou 4
        var prendre = Math.floor(Math.random() * Math.floor(2)); // Donne 0 ou 1
        if(nombre==2){
            if(prendre == 1){
                atout=deck[20].Couleur; // Couleur de l'atout
                addCards("","J1joue");
                //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","J"+nombre+"c" + String(6));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/red_back.png","J"+nombre+"c" + String(6));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","atout"); // Ajoute la carte de l'atout
                aPris="j2";
                joueur=j2;
                joueur.cartes.push(deck[20]);
                for(var i = 21; i<deck.length; i++ ){
                    if(i<23){
                        joueur.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J2c" + String(i-14));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J2c"+String(i-14));
                    }
                    else if(i < 26){
                        j1.cartes.push(deck[i]);
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                    }
                    else if(i<29){
                        j3.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i-20));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J3c"+String(i-20));
                    }
                    else if(i<32){
                        j4.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i-23));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J4c"+String(i-23));
                    }
                }
            }
        }
        if(nombre==3){
            if(prendre==1){
                atout=deck[20].Couleur; // Couleur de l'atout
                addCards("","J1joue");
                //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","J"+nombre+"c" + String(6));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/red_back.png","J"+nombre+"c" + String(6));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","atout"); // Ajoute la carte de l'atout
                aPris="j3";
                joueur=j3;
                joueur.cartes.push(deck[20]);
                for(var i = 21; i<deck.length; i++ ){
                    if(i<23){
                        joueur.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J3c" + String(i-14));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J3c"+String(i-14));
                    }
                    else if(i < 26){
                        j1.cartes.push(deck[i]);
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                    }
                    else if(i<29){
                        j2.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i-20));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J2c"+String(i-20));
                    }
                    else if(i<32){
                        j4.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i-23));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J4c"+String(i-23));
                    }
                }
            }
        }
        if(nombre==4){
            if(prendre == 1){
                atout=deck[20].Couleur; // Couleur de l'atout
                addCards("","J1joue");
                //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","J"+nombre+"c" + String(6));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/red_back.png","J"+nombre+"c" + String(6));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","atout"); // Ajoute la carte de l'atout
                aPris="j4";
                joueur=j4;
                joueur.cartes.push(deck[20]);
                for(var i = 21; i<deck.length; i++ ){
                    if(i<23){
                        joueur.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J4c" + String(i-14));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J4c"+String(i-14));
                    }
                    else if(i < 26){
                        j1.cartes.push(deck[i]);
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                    }
                    else if(i<29){
                        j3.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i-20));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J3c"+String(i-20));
                    }
                    else if(i<32){
                        j2.cartes.push(deck[i]);
                        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i-23));
                        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J2c"+String(i-23));
                    }
                }
            }
        }
        console.log("Atout de la manche : "+atout);
    }

    function prendreAtout(){
        aPris = "j1";
        document.getElementById("prendreB").style.visibility="hidden"; //Cache le bouton prendre atout
        document.getElementById("pasPrendreB").style.visibility="hidden"; //Cache le bouton ne pas prendre atout
        document.getElementById("dernierPliB").style.visibility="visible";// Cache le bouton dernier plis
        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","atout"); // Ajoute la carte de l'atout
        atout=deck[20].Couleur; // Couleur de l'atout
        var joueur = j1;
        joueur.cartes.push(deck[20]);
        addCards("","J1joue");
        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","J1c" + String(6));
        for(var i = 21; i<deck.length; i++ ){
            if(i<23){
                joueur.cartes.push(deck[i]);
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J1c" + String(i-14));
            }
            else if(i < 26){
                j2.cartes.push(deck[i]);
                //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i-17));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J2c"+String(i-17));
            }
            else if(i<29){
                j3.cartes.push(deck[i]);
                //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i-20));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J3c"+String(i-20));
            }
            else if(i<32){
                j4.cartes.push(deck[i]);
                //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i-23));
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png","J4c"+String(i-23));
            }
        }
        jouerRobot();
    }

    function prendrePasAtout(){
        document.getElementById("prendreB").style.visibility="hidden"; //Cache le bouton prendre atout
        document.getElementById("pasPrendreB").style.visibility="hidden"; //Cache le bouton ne pas prendre atout
        document.getElementById("dernierPliB").style.visibility="visible";// Affiche le bouton dernier plis
        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","atout");
        atout=deck[20].Couleur; // Couleur de l'atout

        var nombre = Math.floor(Math.random() * Math.floor(3))+2;
        addCards("","J1joue");
        //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","J"+nombre+"c" + String(6));
        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/red_back.png","J"+nombre+"c" + String(6));

        if(nombre==2){
            aPris="j2";
            joueur=j2;
            joueur.cartes.push(deck[20]);
            for(var i = 21; i<deck.length; i++ ){
                if(i<23){
                    joueur.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J2c" + String(i-14));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J2c" + String(i-14));
                }
                else if(i < 26){
                    j1.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                }
                else if(i<29){
                    j3.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i-20));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J3c" + String(i-20));
                }
                else if(i<32){
                    j4.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i-23));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J4c" + String(i-23));
                }
            }
        }
        if(nombre==3){
            aPris="j3";
            joueur=j3;
            joueur.cartes.push(deck[20]);
            for(var i = 21; i<deck.length; i++ ){
                if(i<23){
                    joueur.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J3c" + String(i-14));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J3c" + String(i-14));
                }
                else if(i < 26){
                    j1.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                }
                else if(i<29){
                    j2.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i-20));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J2c" + String(i-20));
                }
                else if(i<32){
                    j4.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i-23));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J4c" + String(i-23));
                }
            }
        }
        if(nombre==4){
            aPris="j4";
            joueur=j4;
            joueur.cartes.push(deck[20]);
            for(var i = 21; i<deck.length; i++ ){
                if(i<23){
                    joueur.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J4c" + String(i-14));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J4c" + String(i-14));
                }
                else if(i < 26){
                    j1.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                }
                else if(i<29){
                    j3.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i-20));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J3c" + String(i-20));
                }
                else if(i<32){
                    j2.cartes.push(deck[i]);
                    //addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i-23));
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/gray_back.png", "J2c" + String(i-23));
                }
            }
        }
        jouerRobot();
    }

    function jouerCarte(carte){
        var nbCarte = carte.substring(3,4);
        j1.carteJouee = j1.cartes[nbCarte-1];
        //j1.joue();
        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+j1.cartes[nbCarte-1].Valeur+j1.cartes[nbCarte-1].Couleur+".png","J1joue");
        addCards("",carte);
        if(j1.premier){
            valeurJouee = j1.cartes[nbCarte-1].Valeur;
            couleurJouee = j1.cartes[nbCarte-1].Couleur;
            if(couleurJouee == atout){
                pointJouee = j1.cartes[nbCarte-1].PointsAtout;
            }
            else{
                pointJouee = j1.cartes[nbCarte-1].Points;
            }
            console.log(valeurJouee+" "+couleurJouee);
        }

        console.log("QUI JOUE : J1: "+j1.premier+" J2: "+j2.premier+" J3: "+j3.premier+" J4: "+j4.premier);

        if(j1.premier){
            j2.joue();
            j3.joue();
            j4.joue();
            document.getElementById("pliSuivant").style.visibility="visible";
        }
        if(j2.premier){
            document.getElementById("pliSuivant").style.visibility="visible";
        }
        if(j3.premier){
            j2.joue();
            document.getElementById("pliSuivant").style.visibility="visible";
        }
        if(j4.premier){
            j2.joue();
            j3.joue();
            document.getElementById("pliSuivant").style.visibility="visible";
        }
    }

    function pliSuivant(){
        compteurPli++;
        document.getElementById("beloteRebelote").textContent="";
        if(compteurPli<8){
            addDernierPli(); //ajoute le dernier pli en mémoire
            addCards("","J1joue");
            addCards("","J2joue");
            addCards("","J3joue");
            addCards("","J4joue");
            gagnant(); // Défini le gagnant
            compterPoints(); // Compte les points par joueur
            afficherScore();
            jouerRobot(); //Fait jouer l'ia
            console.log("Le premier joueur est: J1: "+j1.premier+" j2 : "+j2.premier+" j3 : "+j3.premier+" j4 : "+j4.premier);
        }
        else{
            addDernierPli(); //ajoute le dernier pli en mémoire
            addCards("","J1joue");
            addCards("","J2joue");
            addCards("","J3joue");
            addCards("","J4joue");
            gagnant(); // Défini le gagnant
            compterPoints(); // Compte les points par joueur
            scoreEquipes(); // Change le score des équipes
            afficherScore();
            document.getElementById("pliSuivant").style.visibility="hidden";
            document.getElementById("mancheSuivante").style.visibility="visible";
        }

    }

    function mancheSuivante(){
        if(scoreEq1 < 501 && scoreEq2 < 501){
            j1.premier=false;
            j2.premier=false;
            j3.premier=false;
            j4.premier=false;
            j1.cartes=[];
            j2.cartes=[];
            j3.cartes=[];
            j4.cartes=[];
            j1.belote=false;
            j2.belote=false;
            j3.belote=false;
            j4.belote=false;
            j1.rebelote=false;
            j2.rebelote=false;
            j3.rebelote=false;
            j4.rebelote=false;

            if(j4.distribue){
                j1.distribue=true;
                document.getElementById("dealerJ1").style.visibility="visible";
                document.getElementById("dealerJ4").style.visibility="hidden";
                j4.distribue=false;
                j2.premier=true;
            }
            else if(j3.distribue){
                j4.distribue=true;
                document.getElementById("dealerJ4").style.visibility="visible";
                document.getElementById("dealerJ3").style.visibility="hidden";
                j3.distribue=false;
                j1.premier=true;
            }
            else if(j2.distribue){
                j3.distribue=true;
                document.getElementById("dealerJ3").style.visibility="visible";
                document.getElementById("dealerJ2").style.visibility="hidden";
                j2.distribue=false;
                j4.premier=true;
            }
            else if(j1.distribue){
                j2.distribue=true;
                document.getElementById("dealerJ2").style.visibility="visible";
                document.getElementById("dealerJ1").style.visibility="hidden";
                j1.distribue=false;
                j3.premier=true;
            }
            j1.points=0;
            j2.points=0;
            j3.points=0;
            j4.points=0;
            compteurPli=0;
            document.getElementById("distribuerButton").style.visibility="visible";
            document.getElementById("mancheSuivante").style.visibility="hidden";
        }
        else{
            finPartie();
            document.getElementById("mancheSuivante").style.visibility="hidden";
            document.getElementById("finPartie").style.visibility="visible";
        }
        j1.beloteRebelote=false;
        j2.beloteRebelote=false;
        j3.beloteRebelote=false;
        j4.beloteRebelote=false;
    }

    function finPartie(){
        console.log("partie terminée");
       if(scoreEq1>501){
           document.getElementById("gagnant1").value="j1";
           document.getElementById("gagnant2").value="j3";
        }
        else{
           document.getElementById("gagnant1").value="j2";
           document.getElementById("gagnant2").value="j4";
        }
        document.getElementById("scoreEquipe1").value=scoreEq1;
        document.getElementById("scoreEquipe2").value=scoreEq2;
    }

    function compterPoints(){
        var valeurj1;
        var valeurj2;
        var valeurj3;
        var valeurj4;

        if(j1.carteJouee.Couleur == atout){
            if(j1.carteJouee.Valeur=="9" || j1.carteJouee.Valeur=="J"){
                valeurj1 = j1.carteJouee.PointsAtout;
            }
            else{
                valeurj1=j1.carteJouee.Points;
            }
        }
        else{
            valeurj1=j1.carteJouee.Points;
        }
        if(j2.carteJouee.Couleur == atout){
            if(j2.carteJouee.Valeur=="9" || j2.carteJouee.Valeur=="J"){
                valeurj2 = j2.carteJouee.PointsAtout;
            }
            else{
                valeurj2=j2.carteJouee.Points;
            }
        }
        else{
            valeurj2=j2.carteJouee.Points;
        }
        if(j3.carteJouee.Couleur == atout){
            if(j3.carteJouee.Valeur=="9" || j3.carteJouee.Valeur=="J"){
                valeurj3 = j3.carteJouee.PointsAtout;
            }
            else{
                valeurj3=j3.carteJouee.Points;
            }
        }
        else{
            valeurj3=j3.carteJouee.Points;
        }
        if(j4.carteJouee.Couleur == atout){
            if(j4.carteJouee.Valeur=="9" || j4.carteJouee.Valeur=="J"){
                valeurj4 = j4.carteJouee.PointsAtout;
            }
            else{
                valeurj4=j4.carteJouee.Points;
            }
        }
        else{
            valeurj4=j4.carteJouee.Points;
        }

        if(j1.premier){
            j1.points=j1.points+valeurj1+valeurj2+valeurj3+valeurj4;
            if(compteurPli==8){
                j1.points +=10;
            }
        }
        else if(j2.premier){
            j2.points=j2.points+valeurj1+valeurj2+valeurj3+valeurj4;
            if(compteurPli==8){
                j2.points +=10;
            }
        }
        else if(j3.premier){
            j3.points=j3.points+valeurj1+valeurj2+valeurj3+valeurj4;
            if(compteurPli==8){
                j3.points +=10;
            }
        }
        else if(j4.premier){
            j4.points=j4.points+valeurj1+valeurj2+valeurj3+valeurj4;
            if(compteurPli==8){
                j4.points +=10;
            }
        }

        console.log("Voici les points de la partie : J1: "+j1.points+" J2: "+j2.points+" J3: "+j3.points+" J4: "+j4.points);
    }

    function scoreEquipes(){ //Calcul le score des équipes en temps réel
        if(j1.beloteRebelote || j3.beloteRebelote){
            j1.points +=10;
            j3.points+=10;
        }
        else if(j2.beloteRebelote || j4.beloteRebelote){
            j2.points +=10;
            j4.points+=10;
        }
        if(aPris=="j1" || aPris=="j3"){
            if(j1.points + j3.points == 162 || j1.points + j3.points == 182){
                scoreEq1 += 252
            }
            else if(j1.points + j3.points >= 81){
                scoreEq1 += j1.points+j3.points;
                scoreEq2 += j2.points+j4.points;
            }
            else if(j1.points + j3.points < 81) {
                scoreEq2 += 162;
                if(j1.beloteRebelote || j3.beloteRebelote){
                    scoreEq1 +=20;
                }
            }
        }
        else if(aPris=="j2" || aPris=="j4"){
            if(j2.points + j4.points == 162 || j2.points + j4.points == 182){
                scoreEq2 += 252
            }
            else if(j2.points + j4.points >= 81){
                scoreEq1 += j1.points+j3.points;
                scoreEq2 += j2.points+j4.points;
            }
            else if(j2.points + j4.points < 81) {
                scoreEq1 += 162;
                if(j2.beloteRebelote || j4.beloteRebelote){
                    scoreEq2 +=20;
                }
            }
        }
    }
    function afficherScore(){
        document.getElementById("scoreE1").textContent=scoreEq1;
        document.getElementById("scoreE2").textContent=scoreEq2;
        document.getElementById("scoreJ1").textContent=j1.points;
        document.getElementById("scoreJ2").textContent=j2.points;
        document.getElementById("scoreJ3").textContent=j3.points;
        document.getElementById("scoreJ4").textContent=j4.points;
    }


    function jouerRobot(){
        if(j1.premier){

        }
        else if(j2.premier){
            j2.joue();
            j3.joue();
            j4.joue();
        }
        else if(j3.premier){
            j3.joue();
            j4.joue();
        }
        else if(j4.premier){
            j4.joue();
        }
    }

    function annulerCarte(joueur, positionCarte){
        joueur.cartes[positionCarte].Jouable = false;
    }


    function addDernierPli(){
        var srcJ1 = document.getElementById("J1joue");
        var srcJ2 = document.getElementById("J2joue");
        var srcJ3 = document.getElementById("J3joue");
        var srcJ4 = document.getElementById("J4joue");
        addCards(srcJ1.src,"dernierPliJ1");
        addCards(srcJ2.src,"dernierPliJ2");
        addCards(srcJ3.src,"dernierPliJ3");
        addCards(srcJ4.src,"dernierPliJ4");
    }
    function dernierPliB(){
        if(isDernierPliCache){
            for(var i = 1; i<=4; i++ ){
                document.getElementById("dernierPliJ"+String(i)).style.visibility="visible";
                document.getElementById("texteJ"+String(i)).style.visibility="visible";
            }
            document.getElementById("dernierPliB").innerHTML = "Cacher le dernier pli";
            isDernierPliCache=false;
        }
        else{
            for(var i = 1; i<=4; i++ ){
                document.getElementById("dernierPliJ"+String(i)).style.visibility="hidden";
                document.getElementById("texteJ"+String(i)).style.visibility="hidden";
            }
            document.getElementById("dernierPliB").innerHTML = "Voir le dernier pli";
            isDernierPliCache=true;
        }
    }

</script>
<!-- CSS-->
<style>body{background-color:steelblue;}</style>
<style>
    body{height:100%;width:100%;background-color: lightblue;}
    .card{height:12%; width:4%;}
    #J1c1{position : absolute; left:35%; top:85%}
    #J1c2{position : absolute; left:39.2%; top:85%}
    #J1c3{position : absolute; left:43.4%; top:85%}
    #J1c4{position : absolute; left:47.6%; top:85%}
    #J1c5{position : absolute; left:51.8%; top:85%}
    #J1c6{position : absolute; left:56%; top:85%}
    #J1c7{position : absolute; left:60.2%; top:85%}
    #J1c8{position : absolute; left:64.4%; top:85%}

    #J2c1{position : absolute; left:25%; top:18%; transform:  rotate(90deg);}
    #J2c2{position : absolute; left:25%; top:26%; transform:  rotate(90deg);}
    #J2c3{position : absolute; left:25%; top:34%; transform:  rotate(90deg);}
    #J2c4{position : absolute; left:25%; top:42%; transform:  rotate(90deg);}
    #J2c5{position : absolute; left:25%; top:50%; transform:  rotate(90deg);}
    #J2c6{position : absolute; left:25%; top:58%; transform:  rotate(90deg);}
    #J2c7{position : absolute; left:25%; top:66%; transform:  rotate(90deg);}
    #J2c8{position : absolute; left:25%; top:74%; transform:  rotate(90deg);}

    #J3c1{position : absolute; left:35%; top:5%}
    #J3c2{position : absolute; left:39.2%; top:5%}
    #J3c3{position : absolute; left:43.4%; top:5%}
    #J3c4{position : absolute; left:47.6%; top:5%}
    #J3c5{position : absolute; left:51.8%; top:5%}
    #J3c6{position : absolute; left:56%; top:5%}
    #J3c7{position : absolute; left:60.2%; top:5%}
    #J3c8{position : absolute; left:64.4%; top:5%}

    #J4c1{position : absolute; left:74.4%; top:18%; transform:  rotate(90deg);}
    #J4c2{position : absolute; left:74.4%; top:26%; transform:  rotate(90deg);}
    #J4c3{position : absolute; left:74.4%; top:34%; transform:  rotate(90deg);}
    #J4c4{position : absolute; left:74.4%; top:42%; transform:  rotate(90deg);}
    #J4c5{position : absolute; left:74.4%; top:50%; transform:  rotate(90deg);}
    #J4c6{position : absolute; left:74.4%; top:58%; transform:  rotate(90deg);}
    #J4c7{position : absolute; left:74.4%; top:66%; transform:  rotate(90deg);}
    #J4c8{position : absolute; left:74.4%; top:74%; transform:  rotate(90deg);}

    #J3joue{position : absolute; left:49.5%; top:35%;}
    #J2joue{position : absolute; left:44.5%; top:48%;}
    #J1joue{position : absolute; left:49.5%; top:60%;}
    #J4joue{position : absolute; left:54.5%; top:48%;}

    #dernierPliJ1{position : absolute; left:5%; top:40%;visibility:hidden;}
    #dernierPliJ2{position : absolute; left:9.2%; top:40%;visibility:hidden;}
    #dernierPliJ3{position : absolute; left:13.4%; top:40%;visibility:hidden;}
    #dernierPliJ4{position : absolute; left:17.6%; top:40%;visibility:hidden;}
    #texteJ1{position : absolute; left:6.5%; top:33%;visibility:hidden;}
    #texteJ2{position : absolute; left:10.7%; top:33%;visibility:hidden;}
    #texteJ3{position : absolute; left:14.9%; top:33%;visibility:hidden;}
    #texteJ4{position : absolute; left:19.1%; top:33%;visibility:hidden;}

    #atout{position : absolute; left:8%; top:85%}
    #atoutDos{position : absolute; left:12%; top:85%}
    #texteAtout{position : absolute; left:10%; top:78%;}
    #distribuerButton{position : absolute; left:34%; top:48%; visibility: visible;}
    #prendreB{position : absolute; left:80%; top:86%}
    #pliSuivant{position : absolute; left:62%; top:48%}
    #finPartie{visibility: hidden}
    #mancheSuivante{position : absolute; left:62%; top:48%}
    #finPartie{position : absolute; left:45%; top:48%}
    #pasPrendreB{position : absolute; left:80%; top:92%}
    #dernierPliB{position : absolute; left:7.5%; top:53%}
    .styleBouton {
        box-shadow: 0px 0px 0px 2px #9fb4f2;
        background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
        background-color:#7892c2;
        border-radius:17px;
        border:1px solid #4e6096;
        display:inline-block;
        cursor:pointer;
        color:#ffffff;
        font-family:Arial;
        font-size:19px;
        padding:12px 37px;
        text-decoration:none;
        text-shadow:0px 1px 0px #283966;
        visibility: hidden;
    }
    .styleBouton:hover {
        background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
        background-color:#476e9e;
    }
    .myBustyleBoutontton:active {
        position:relative;
        top:1px;
    }
    .cardJ1:hover{
        -webkit-transform:scale(1.25);
        -moz-transform:scale(1.25);
        -ms-transform:scale(1.25);
        -o-transform:scale(1.25);
        transform:scale(1.25);
    }
    .cardJ1{height:12%; width:4%;}

    p{
        font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
        font-size: 24px;
        letter-spacing: -0.4px;
        word-spacing: 2px;
        color: #000000;
        font-weight: 400;
        text-decoration: none;
        font-style: normal;
        font-variant: small-caps;
        text-transform: none;
    }

    #ScoreTotal{position : absolute; left:87%; top:0.2%; font-size: 30px;}
    #scoreE1T{position : absolute; left:80%; top:5%}
    #scoreE2T{position : absolute; left:90%; top:5%}
    #scoreJ1T{position : absolute; left:80%; top:8%}
    #scoreJ3T{position : absolute; left:80%; top:11%}
    #scoreJ2T{position : absolute; left:90%; top:8%}
    #scoreJ4T{position : absolute; left:90%; top:11%}

    #scoreE1{position : absolute; left:85.5%; top:5%}
    #scoreE2{position : absolute; left:95.5%; top:5%}
    #scoreJ1{position : absolute; left:84%; top:8%}
    #scoreJ3{position : absolute; left:84%; top:11%}
    #scoreJ2{position : absolute; left:94%; top:8%}
    #scoreJ4{position : absolute; left:94%; top:11%}

    #j1Pseudo{position : absolute; left:50%; top:75%}
    #j2Pseudo{position : absolute; left:35%; top:40%}
    #j3Pseudo{position : absolute; left:50%; top:20%}
    #j4Pseudo{position : absolute; left:63%; top:40%}

    #beloteRebelote{position : absolute; left:92%; top:48%}

    #dealerJ1{position : absolute; left:45%; top:75%; width: 4%; height: 8%; visibility: hidden}
    #dealerJ2{position : absolute; left:35%; top:35%; width: 4%; height: 8%; visibility: hidden}
    #dealerJ3{position : absolute; left:45%; top:20%; width: 4%; height: 8%; visibility: hidden}
    #dealerJ4{position : absolute; left:63%; top:35%; width: 4%; height: 8%; visibility: visible}


</style>

<p id="ScoreTotal">Score</p>
<p id="scoreE1T">Equipe 1 : </p>
<p id="scoreJ1T">J1 :  </p>
<p id="scoreJ3T">J3 :  </p>
<p id="scoreE2T">Equipe 2 : </p>
<p id="scoreJ2T">J2 :  </p>
<p id="scoreJ4T">J4 :  </p>
<p id="scoreE1"></p>
<p id="scoreJ1"></p>
<p id="scoreJ3"></p>
<p id="scoreE2"></p>
<p id="scoreJ2"></p>
<p id="scoreJ4"></p>

<p id="j1Pseudo">J1 : <%=session.getAttribute("pseudo")%></p>
<p id="j2Pseudo">J2 : <%=session.getAttribute("J2")%></p>
<p id="j3Pseudo">J3 : <%=session.getAttribute("J3")%></p>
<p id="j4Pseudo">J4 : <%=session.getAttribute("J4")%></p>

<p id="beloteRebelote"></p>


<img src="https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/dealer.png" id="dealerJ1" >
<img src="https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/dealer.png" id="dealerJ2" >
<img src="https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/dealer.png" id="dealerJ3" >
<img src="https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/dealer.png" id="dealerJ4">

<img src="" class="cardJ1" id="J1c1" onclick="jouerCarte(this.id)">
<img src="" class="cardJ1" id="J1c2" onclick="jouerCarte(this.id)">
<img src="" class="cardJ1" id="J1c3" onclick="jouerCarte(this.id)">
<img src="" class="cardJ1" id="J1c4" onclick="jouerCarte(this.id)">
<img src="" class="cardJ1" id="J1c5" onclick="jouerCarte(this.id)">
<img src="" class="cardJ1" id="J1c6" onclick="jouerCarte(this.id)">
<img src="" class="cardJ1" id="J1c7" onclick="jouerCarte(this.id)">
<img src="" class="cardJ1" id="J1c8" onclick="jouerCarte(this.id)">

<img src="" class="card" id="J2c1">
<img src="" class="card" id="J2c2">
<img src="" class="card" id="J2c3">
<img src="" class="card" id="J2c4">
<img src="" class="card" id="J2c5">
<img src="" class="card" id="J2c6">
<img src="" class="card" id="J2c7">
<img src="" class="card" id="J2c8">

<img src="" class="card" id="J3c1">
<img src="" class="card" id="J3c2">
<img src="" class="card" id="J3c3">
<img src="" class="card" id="J3c4">
<img src="" class="card" id="J3c5">
<img src="" class="card" id="J3c6">
<img src="" class="card" id="J3c7">
<img src="" class="card" id="J3c8">

<img src="" class="card" id="J4c1">
<img src="" class="card" id="J4c2">
<img src="" class="card" id="J4c3">
<img src="" class="card" id="J4c4">
<img src="" class="card" id="J4c5">
<img src="" class="card" id="J4c6">
<img src="" class="card" id="J4c7">
<img src="" class="card" id="J4c8">

<img src="" class="card" id="J1joue">
<img src="" class="card" id="J2joue">
<img src="" class="card" id="J3joue">
<img src="" class="card" id="J4joue">

<img src="" class="card" id="dernierPliJ1">
<img src="" class="card" id="dernierPliJ2">
<img src="" class="card" id="dernierPliJ3">
<img src="" class="card" id="dernierPliJ4">
<button class="styleBouton"  id="dernierPliB" type="button" onclick="dernierPliB();">Voir le dernier pli</button>
<p id="texteJ1">J1</p>
<p id="texteJ2">J2</p>
<p id="texteJ3">J3</p>
<p id="texteJ4">J4</p>

<button class="styleBouton" id="distribuerButton" type="button" onclick="distribuer();">Distribuer</button>

<img src="https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/red_back.png" class="card" id="atout">
<img src="https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/red_back.png" class="card" id="atoutDos">
<p id="texteAtout">ATOUT</p>

<button class="styleBouton"  id="prendreB" type="button" hidden onclick="prendreAtout();">Prendre atout</button>
<button class="styleBouton"  id="pasPrendreB" type="button"onclick="prendrePasAtout();">Ne pas prendre atout</button>

<button class="styleBouton"  id="pliSuivant" type="button" hidden onclick="pliSuivant();">Pli suivant</button>
<button class="styleBouton"  id="mancheSuivante" type="button" hidden onclick="mancheSuivante();">Manche suivante</button>
<!--<button class="styleBouton"  id="finPartie" type="button" hidden onclick="finPartie();" >Partie terminée</button>-->

<form action="/partieTerminee" method="post" class="form-example" id="form1">
    <input type="hidden" name="gagnant1" id="gagnant1" value="testGagnant1" >
    <input type="hidden" name="gagnant2" id="gagnant2" value="testGagnant2">
    <input type="hidden" name="scoreEquipe1" id="scoreEquipe1" value="100">
    <input type="hidden" name="scoreEquipe2" id="scoreEquipe2" value="200">
    <button class="styleBouton" form="form1" type="submit" value="Submit" id="finPartie" >TERMINER LA PARTIE</button>
</form>


</body>
</html>
