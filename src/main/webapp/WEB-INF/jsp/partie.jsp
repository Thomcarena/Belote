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

    class joueur{
        cartes=[];
        nom;
    }
    var j1 = new joueur();
    var j2 = new joueur();
    var j3 = new joueur();
    var j4 = new joueur();

    j1.nom="J1";
    j2.nom="J2";
    j3.nom="J3";
    j4.nom="J4";

    function distribuer() {




        var joueurDistribue = 1;

        //Création du paquet
        deck = getDeck();
        shuffle(deck);

        //Remplissage de la main du joueur 1
       /* if(premiereDistribution){
            for (var i = 0; i<5; i++) {
                j1.cartes.push(deck[i]);
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J1c" + String(i + 1));

            }
        }
        else{
            for (var i = 5; i<8; i++) {
                j1.cartes.push(deck[i]);
                addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/" + deck[i].Valeur + deck[i].Couleur + ".png", "J1c" + String(i + 1));
            }
        }

        //Remplissage de la main du joueur 2
        for (var i = 8; i<16; i++){
            j2.cartes.push(deck[i]);
            addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J2c"+String(i+1-8));
        }
        //Remplissage de la main du joueur 3
        for (var i = 16; i<24; i++){
            j3.cartes.push(deck[i]);
            addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J3c"+String(i+1-16));
        }
        //Remplissage de la main du joueur 4
        for (var i = 24; i<32; i++){
            j4.cartes.push(deck[i]);
            addCards("https://raw.githubusercontent.com/Thomcarena/Belote/master/src/main/medias/"+deck[i].Valeur+deck[i].Couleur+".png","J4c"+String(i+1-24));
        }

        var premierJoueur = Math.floor(Math.random() * Math.floor(4)) + 1;

        console.log(j1.cartes[1].Valeur+j1.cartes[1].Couleur);*/

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

        for(var i = 0; i < couleur.length; i++)
        {
            for(var x = 0; x < valeur.length; x++)
            {
                var card = {Valeur: valeur[x], Couleur: couleur[i]};
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
    }
    .styleBouton:hover {
        background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
        background-color:#476e9e;
    }
    .myBustyleBoutontton:active {
        position:relative;
        top:1px;
    }


</style>
<p>Sympa le background</p>

<img src="" class="card" id="J1c1">
<img src="" class="card" id="J1c2">
<img src="" class="card" id="J1c3">
<img src="" class="card" id="J1c4">
<img src="" class="card" id="J1c5">
<img src="" class="card" id="J1c6">
<img src="" class="card" id="J1c7">
<img src="" class="card" id="J1c8">

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

<button class="btn btn-outline-primary" type="button" onclick="distribuer();">Distribuer les cartes</button>

<img src="gray_back.png" class="card" id="atout">
<p id="texteAtout">ATOUT</p>

<button class="styleBouton" id="prendreB" type="button" onclick="prendreAtout();">Prendre atout</button>
<button class="styleBouton" id="pasPrendreB" type="button"onclick="prendrePasAtout();">Ne pas prendre atout</button>
<!--<button class="btn btn-outline-primary" type="button" onclick="prendreAtout();">Prendre Atout</button>
<button class="btn btn-outline-primary" type="button" onclick="prendrePasAtout();">Prendre Atout</button>-->


</body>
</html>
