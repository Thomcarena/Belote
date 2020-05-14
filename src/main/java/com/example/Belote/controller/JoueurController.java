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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
        return ("creerJoueur");
    }

   /* @GetMapping(value = "/getJoueur")
    public List<Joueur> vueJoueur(){
        return joueurservice.findAllJoueurByPseudo();
    }*/

    @PostMapping(value ="/createJoueur")
    public Joueur creationJoueur(HttpServletRequest request, @Valid Joueur joueur){
        String pseudo = request.getParameter("pseudo");
        String mdp = request.getParameter("mdp");
        int age = Integer.parseInt(request.getParameter("age"));
        String sexe = request.getParameter("sexe");
        String ville = request.getParameter("ville");
        System.out.println(pseudo+" "+mdp+" "+age+" "+sexe+" "+ville);
        return joueurService.createJoueur(pseudo, mdp, age, sexe, ville);
       // return joueurService.createJoueur("max", "silver", 24, "F", "Pau");
    }

    @GetMapping(value ="/readJoueur")
    public Joueur lireJoueur(){
        return joueurService.readJoueur("VassDK","silver");
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
