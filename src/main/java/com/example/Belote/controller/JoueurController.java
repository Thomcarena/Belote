/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Belote.controller;

import com.example.Belote.DAO.Service.Joueur.JoueurService;
import com.example.Belote.POJO.Joueur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 *
 * @author thoma
 */
@Controller
public class JoueurController {
    @Autowired
    private JoueurService joueurService;

    // Page du formulaire de la création d'un joueur
    @RequestMapping(value = {"/formCreateJoueur"}, method = RequestMethod.GET)
    public String register(Model model){
        model.addAttribute("joueur",new Joueur());
        return ("formCreateJoueur");
    }

    // Page de connexion
    @RequestMapping(value = {"/formConnexionJoueur"}, method = RequestMethod.GET)
    public String login(Model model){
        //model.addAttribute("joueur",new Joueur());
        return ("formConnexionJoueur");
    }

    // Page de connexion
    @RequestMapping(value = {"/accueilBelote"}, method = RequestMethod.GET)
    public String accueilBelote(Model model){
        //model.addAttribute("joueur",new Joueur());
        return ("accueilBelote");
    }

    // Page de l'accueil du jeu
    @RequestMapping(value = {"/formModifierJoueur"}, method = RequestMethod.GET)
    public String modif(Model model){
        //model.addAttribute("joueur",new Joueur());
        return ("formModifierJoueur");
    }


    // Vérification des identifiants pour la connexion
    @GetMapping(value ="/verifConnexion")
    public String verifConnexion(HttpServletRequest request, @Valid Joueur joueur){
        String pseudo = request.getParameter("pseudo");
        String mdp = request.getParameter("mdp");

        Joueur test = joueurService.readJoueur(pseudo,mdp);
        if (test == null){
            return ("erreurConnexion");
        }
        else{
            HttpSession session = request.getSession();
            session.setAttribute("pseudo",pseudo);
            session.setAttribute("mdp",mdp);
            session.setAttribute("age",test.getAgeJ());
            session.setAttribute("sexe",test.getSexeJ());
            session.setAttribute("ville", test.getVilleJ());
            return ("accueilBelote");
        }
    }

    // Page de modification de compte
    @PostMapping (value = {"/modifierCompte"})
    public String modifierCompte(HttpServletRequest request, @Valid Joueur joueur){
        //model.addAttribute("joueur",new Joueur());
        HttpSession session = request.getSession();
        String pseudo = (String) session.getAttribute("pseudo");
        String mdp = request.getParameter("mdp");
        int age = Integer.parseInt(request.getParameter("age"));
        String sexe = request.getParameter("sexe");
        String ville = request.getParameter("ville");
        joueurService.updateJoueur(pseudo, mdp, age, sexe, ville);
        Joueur j = joueurService.readJoueur(pseudo,mdp);
        // Modifier les attributs dans la session
        session.setAttribute("pseudo",j.getPseudoJ());
        session.setAttribute("mdp",j.getMdpJ());
        session.setAttribute("age",j.getAgeJ());
        session.setAttribute("sexe",j.getSexeJ());
        session.setAttribute("ville", j.getVilleJ());

        return ("accueilBelote");
    }

    @PostMapping(value ="/createJoueur")
    public Joueur creationJoueur(HttpServletRequest request, @Valid Joueur joueur){
        String pseudo = request.getParameter("pseudo");
        String mdp = request.getParameter("mdp");
        int age = Integer.parseInt(request.getParameter("age"));
        String sexe = request.getParameter("sexe");
        String ville = request.getParameter("ville");
        return joueurService.createJoueur(pseudo, mdp, age, sexe, ville);
        // return joueurService.createJoueur("max", "silver", 24, "F", "Pau");
    }

    @GetMapping(value ="/readJoueur")
    public Joueur lireJoueur(HttpServletRequest request, @Valid Joueur joueur){
        String pseudo = request.getParameter("pseudo");
        String mdp = request.getParameter("mdp");
        System.out.println(joueurService.readJoueur(pseudo,mdp));
        return joueurService.readJoueur(pseudo,mdp);
    }

    @PutMapping(value ="/updateJoueur")
    public Joueur majJoueur(){
        return joueurService.updateJoueur("VassDK", "gold", 24, "H", "Pau", 0, 0, 0);
    }

    @DeleteMapping(value ="/deleteJoueur")
    public void effacerJoueur(){
        joueurService.deleteJoueur("toto");
    }


}
