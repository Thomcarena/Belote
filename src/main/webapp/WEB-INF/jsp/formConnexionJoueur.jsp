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


<!-- <div class="container"><h1>Connexion</h1></div>
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
</form>-->





<!-- Forme -->
<div id="wrapper" class="wrapper">
    <div class="container">
        <h1>Veuillez entrer vos identifiants</h1>
        <div id="error" class="error"></div>
        <form action="/verifConnexion" class="form" id="signup" method="get" class="form-example">
            <input type="text" id="email" name="pseudo" placeholder="Identifiant" required>
            <input type="password" id="password" name="mdp" placeholder="Mot de passe" required>
            <button type="submit" id="login-button" class="loginbutton" form="signup">Se connecter</button>
        </form>
    </div>
</div>

<!-- CSS -->
<style>
    @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);
    * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-weight: 300;
    }
    body {
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        font-weight: 300;
    }
    body ::-webkit-input-placeholder {
        /* WebKit browsers */
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        font-weight: 300;
    }
    body :-moz-placeholder {
        /* Mozilla Firefox 4 to 18 */
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        opacity: 1;
        font-weight: 300;
    }
    body ::-moz-placeholder {
        /* Mozilla Firefox 19+ */
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        opacity: 1;
        font-weight: 300;
    }
    body :-ms-input-placeholder {
        /* Internet Explorer 10+ */
        font-family: 'Source Sans Pro', sans-serif;
        color: white;
        font-weight: 300;
    }
    .wrapper {
        background: #50a3a2;
        background: -webkit-gradient(linear, left top, right bottom, from(#50a3a2), to(#53e3a6));
        background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
        position: absolute;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
    }
    .wrapper.form-success .container h1 {
        -webkit-transform: translateY(85px);
        transform: translateY(85px);
    }
    .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 80px 0;
        height: 400px;
        text-align: center;
    }
    .container h1 {
        font-size: 40px;
        -webkit-transition-duration: 1s;
        transition-duration: 1s;
        -webkit-transition-timing-function: ease-in;
        transition-timing-function: ease-in;
        font-weight: 200;
    }
    form {
        padding: 20px 0;
        position: relative;
        z-index: 2;
    }
    form input {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        outline: 0;
        border: 1px solid rgba(255, 255, 255, 0.4);
        background-color: rgba(255, 255, 255, 0.2);
        width: 250px;
        border-radius: 3px;
        padding: 10px 15px;
        margin: 0 auto 10px auto;
        display: block;
        text-align: center;
        font-size: 18px;
        color: white;
        -webkit-transition-duration: 0.25s;
        transition-duration: 0.25s;
        font-weight: 300;
    }
    form input:hover {
        background-color: rgba(255, 255, 255, 0.4);
    }
    form input:focus {
        background-color: white;
        width: 300px;
        color: #53e3a6;
    }
    .loginbutton {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        outline: 0;
        background-color: white;
        border: 0;
        padding: 10px 15px;
        color: #53e3a6;
        border-radius: 3px;
        width: 125px;
        cursor: pointer;
        font-size: 18px;
        -webkit-transition-duration: 0.25s;
        transition-duration: 0.25s;
    }
    form button:hover {
        background-color: #f5f7f9;
    }
    .fadeout {
        visibility: hidden;
        opacity: 0;
        transition: visibility 0s .5s, opacity .5s linear;
    }

    .fadeout2 {
        visibility: hidden;
        opacity: 0;
        transition: visibility 0s .5s, opacity .5s linear;
    }

    @keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
    .fadein {
        opacity: 0;
        animation:fadeIn ease-in 1;
        animation-fill-mode: forwards;
        animation-duration: 0.5s;
        animation-delay: 0.5s;
    }

    .error {
        color: #fcd6e6;
    }

    .role {
        margin-top:-150px;
    }

    .characters-wrapper {
        margin-top:-75px;
    }

    .characters {
        width:30%;
        margin:1.5%;
        float:left;
    }

    .hidden {
        display:none;
    }

    .nosignin {
        margin-top:20px;
        font-size: .8em;
    }
</style>


<!-- JS -->
<script>
    var client = Kinvey.init({
        appKey: 'kid_rk7NMn57z',
        appSecret: '3ecc483bd0864882b0c69965030961c6'
    });

    const heroRoleId = '0278b7bf-749f-453f-9b74-4a0b2afcfcff',
        villainRoleId = '1707214d-5c2f-436c-82d4-6e198749251d';

    // for the sake of simplicity in a sample app, I am always logging the current active user out when the page is loaded
    var promise = Kinvey.User.logout();

    // sign up a new user with Kinvey authentication
    document.getElementById('signup-button').addEventListener('click', function(event) {
        // If you want to validate these inputs before sending them to the backend you should do that here
        var user = new Kinvey.User();
        var promise = user.signup({
            username: document.getElementById('email').value,
            password: document.getElementById('password').value
        })
            .then(function(user) {
                loginSuccess();
                console.log(user);
            })
            .catch(function(error) {
                // for the sake of simplicity, I'm just displaying any errors that the API sends me back
                document.getElementById('error').innerHTML = error.message;
            });
    });

    // login using the Kinvey authentication
    document.getElementById('login-button').addEventListener('click', function(event) {
        var user = new Kinvey.User();
        var promise = user.login({
            username: document.getElementById('email').value,
            password: document.getElementById('password').value
        })
            .then(function(user) {
                loginSuccess();
                console.log(user);
            })
            .catch(function(error) {
                document.getElementById('error').innerHTML = error.message;
            });
    });

    // sign up or log in with Google authentication
    document.getElementById('google-login').addEventListener('click', function(event) {
        var promise = Kinvey.User.loginWithMIC(window.location.href);
        promise.then(function onSuccess(user) {
            loginSuccess();
            console.log(user);
        }).catch(function onError(error) {
            document.getElementById('error').innerHTML = error.message;
        });
    });

    // log in an implicit user (i.e. anonymous) that defaults to the all users role
    document.getElementById('nosignin').addEventListener('click', function () {
        loginSuccess();
        document.getElementById('rolechooser').classList.add('fadeout');
        var promise = Kinvey.User.signup()
            .then(function(user) {
                loadData();
            }).catch(function(error) {
                console.log(error);
            });
    });

    // just in case, remove the other role first then pass the hero role id to assign the role
    document.getElementById('hero-button').addEventListener('click', function(event) {
        var userid = Kinvey.User.getActiveUser(client)._id,
            promise = Kinvey.CustomEndpoint.execute('deleteRole', {
                userid: userid,
                roleid: villainRoleId
            })
                .then(function(response) {
                    setRole(heroRoleId);
                })
                .catch(function(error) {
                    console.log(error);
                });
    });

    // // just in case, remove the other role first then pass the villain role id to assign the role
    document.getElementById('villain-button').addEventListener('click', function(event) {
        var userid = Kinvey.User.getActiveUser(client)._id,
            promise = Kinvey.CustomEndpoint.execute('deleteRole', {
                userid: userid,
                roleid: heroRoleId
            })
                .then(function(response) {
                    setRole(villainRoleId);
                })
                .catch(function(error) {
                    console.log(error);
                });

    });

    // change some styles when a user log in succeeds
    function loginSuccess() {
        var rolechooser = document.getElementById('rolechooser');

        document.getElementById('signup').classList.add('fadeout');
        document.getElementById('wrapper').classList.add('form-success');
        rolechooser.classList.remove('hidden');
        rolechooser.classList.add('fadein');
    }

    // set the user role via the REST API (not available in SDK at the moment)
    function setRole(roleid) {
        var userid = Kinvey.User.getActiveUser(client)._id,
            promise = Kinvey.CustomEndpoint.execute('addRole', {
                userid: userid,
                roleid: roleid
            })
                .then(function(response) {
                    console.log(response);
                    document.getElementById('rolechooser').classList.add('fadeout');
                    loadData();
                })
                .catch(function(error) {
                    console.log(error);
                });
    }

    // load data from 3 collections - one with all user access, one with hero only and one with villain only
    function loadData() {
        var ordinary_ds = Kinvey.DataStore.collection('ordinary-people'),
            heroes_ds = Kinvey.DataStore.collection('heroes'),
            villains_ds = Kinvey.DataStore.collection('villains');
        ordinary_ds.pull()
            .then(function(ordinaries) {
                var el = document.getElementById('ordinaries-list'),
                    chrList = '';
                ordinaries.forEach(function(ordinary) {
                    chrList += '<li>' + ordinary.name + '</li>';
                });
                el.innerHTML = chrList;
                displayCharacters();
            })
            .catch(function(error) {
                console.log(error);
            });
        heroes_ds.pull()
            .then(function(heroes) {
                var el = document.getElementById('heroes-list'),
                    chrList = '';
                heroes.forEach(function(hero) {
                    chrList += '<li>' + hero.hero_name + '</li>';
                });
                el.innerHTML = chrList;
                displayCharacters();
            })
            .catch(function(error) {
                console.log(error);
                if (error.code == 401) {
                    var el = document.getElementById("heroes-list").innerHTML = '<li>Unauthorized</li>'
                }
            });
        villains_ds.pull()
            .then(function(villains) {
                var el = document.getElementById('villains-list'),
                    chrList = '';
                villains.forEach(function(villain) {
                    chrList += '<li>' + villain.villain_name + '</li>';
                });
                el.innerHTML = chrList;
                displayCharacters();
            })
            .catch(function(error) {
                console.log(error);
                if (error.code == 401) {
                    var el = document.getElementById("villains-list").innerHTML = '<li>Unauthorized</li>'
                }
            });
    }

    // just a simple utility to determine if the lists are already displayed and display them
    function displayCharacters() {
        display = document.getElementById('display-characters');
        if (display.classList.contains('hidden')) {
            display.classList.remove('hidden');
            display.classList.add('fadein');
        }
    }
</script>
</body>
</html>
