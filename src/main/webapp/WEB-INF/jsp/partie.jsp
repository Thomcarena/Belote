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



    class joueur{
        cartes=[];
        nom;
        premier=false;

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
                    break;
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
                }
            }
            console.log("Meilleure carte que je vais jouer :"+meilleureCarte.Valeur+" "+meilleureCarte.Couleur);
            addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+meilleureCarte.Valeur+meilleureCarte.Couleur+".png",this.nom+"joue");
            //console.log(this.nom+"c"+positionMeilleureCarte-nbTours);
            positionMeilleureCarte++;
            addCards("",this.nom+"c"+String(positionMeilleureCarte));
            annulerCarte(this,positionMeilleureCarte-1);
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

    function distribuer() {
        document.getElementById("distribuerButton").style.visibility="hidden"; //Cache le bouton distribuer
        document.getElementById("prendreB").style.visibility="visible"; //Montre le bouton prendre atout
        document.getElementById("pasPrendreB").style.visibility="visible"; //Montre le bouton ne pas prendre atout

        var joueurDistribue = 1;

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
                   addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i+1-5));
               }
               else if(i<15){
                   j3.cartes.push(deck[i]);
                   addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i+1-10));
               }
               else if(i<20){
                   j4.cartes.push(deck[i]);
                   addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i+1-15));
               }
               addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","J1joue");
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

    function prendreAtout(){
        document.getElementById("prendreB").style.visibility="hidden"; //Cache le bouton prendre atout
        document.getElementById("pasPrendreB").style.visibility="hidden"; //Cache le bouton ne pas prendre atout
        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","atout"); // Ajoute la carte de l'atout
        atout=deck[20].Couleur; // Couleur de l'atout
        console.log(atout);
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
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i-17));
            }
            else if(i<29){
                j3.cartes.push(deck[i]);
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i-20));
            }
            else if(i<32){
                j4.cartes.push(deck[i]);
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i-23));
            }
        }
    }

    function prendrePasAtout(){
        document.getElementById("prendreB").style.visibility="hidden"; //Cache le bouton prendre atout
        document.getElementById("pasPrendreB").style.visibility="hidden"; //Cache le bouton ne pas prendre atout
        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","atout");

        var nombre = Math.floor(Math.random() * Math.floor(3))+2;
        addCards("","J1joue");
        addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[20].Valeur+deck[20].Couleur+".png","J"+nombre+"c" + String(6));
        if(nombre==2){
            joueur=j2;
            for(var i = 21; i<deck.length; i++ ){
                if(i<23){
                    joueur.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J2c" + String(i-14));
                }
                else if(i < 26){
                    j1.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                }
                else if(i<29){
                    j3.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i-20));
                }
                else if(i<32){
                    j4.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i-23));
                }
            }
        }
        if(nombre==3){
            joueur=j3;
            for(var i = 21; i<deck.length; i++ ){
                if(i<23){
                    joueur.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J3c" + String(i-14));
                }
                else if(i < 26){
                    j1.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                }
                else if(i<29){
                    j2.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i-20));
                }
                else if(i<32){
                    j4.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i-23));
                }
            }
        }
        if(nombre==4){
            joueur=j4;
            for(var i = 21; i<deck.length; i++ ){
                if(i<23){
                    joueur.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J4c" + String(i-14));
                }
                else if(i < 26){
                    j1.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J1c"+String(i-17));
                }
                else if(i<29){
                    j3.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i-20));
                }
                else if(i<32){
                    j2.cartes.push(deck[i]);
                    addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i-23));
                }
            }
        }
    }

    function jouerCarte(carte){
        var nbCarte = carte.substring(3,4);
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
        j2.joue();
        j3.joue();
        j4.joue();
        nbTours++;
    }

    function annulerCarte(joueur, positionCarte){
        joueur.cartes[positionCarte].Jouable = false;
    }

    function joueurSuivant(){
        if(j1.premier){
            j1.premier=false;
            j2.premier=true;
        }
        if(j2.premier){
            j2.premier=false;
            j3.premier=true;
        }
        if(j3.premier){
            j3.premier=false;
            j4.premier=true;
        }
        if(j4.premier){
            j4.premier=false;
            j1.premier=true;
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

    #atout{position : absolute; left:10%; top:85%}
    #texteAtout{position : absolute; left:10.7%; top:81%;}

    #prendreB{position : absolute; left:80%; top:86%}
    #pasPrendreB{position : absolute; left:80%; top:92%}
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


</style>
<p>Sympa le background</p>

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

<button class="btn btn-outline-primary" id="distribuerButton" type="button" onclick="distribuer();">Distribuer les cartes</button>

<img src="gray_back.png" class="card" id="atout">
<p id="texteAtout">ATOUT</p>

<button class="styleBouton"  id="prendreB" type="button" hidden onclick="prendreAtout();">Prendre atout</button>
<button class="styleBouton"  id="pasPrendreB" type="button"onclick="prendrePasAtout();">Ne pas prendre atout</button>


</body>
</html>
