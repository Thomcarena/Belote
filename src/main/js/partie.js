var couleur = ["piques", "coeur", "carreau", "trèfle"];
var valeur = ["A", "7", "8", "9", "10", "J", "Q", "K"];
class joueur{
    cartes=[];
}


function distribuer() {


    var j1 = new joueur();
    var j2 = new joueur();
    var j3 = new joueur();
    var j4 = new joueur();

    var joueurDistribue = 1;

    //Création du paquet
    deck = getDeck();
    shuffle(deck);

    //Remplissage de la main du joueur 1
    for (var i = 0; i<8; i++){
        j1.cartes.push(deck[i]);
    }
    //Remplissage de la main du joueur 2
    for (var i = 8; i<16; i++){
        j2.cartes.push(deck[i]);
    }
    //Remplissage de la main du joueur 3
    for (var i = 16; i<24; i++){
        j3.cartes.push(deck[i]);
    }
    //Remplissage de la main du joueur 4
    for (var i = 24; i<32; i++){
        j4.cartes.push(deck[i]);
    }

    var premierJoueur = Math.floor(Math.random() * Math.floor(4)) + 1;

    console.log(j1.cartes+" "+j2.cartes+" "+j3.cartes+" "+j4.cartes);

}

function getDeck()
{
    var deck = new Array();

    for(var i = 0; i < couleur.length; i++)
    {
        for(var x = 0; x < valeur.length; x++)
        {
            var card = {Value: valeur[x], Suit: couleur[i]};
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
