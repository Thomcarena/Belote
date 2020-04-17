/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Belote.controller;

import com.example.Belote.DAO.Service.Joueur.JoueurService;
import com.example.Belote.POJO.Joueur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author thoma
 */
@RestController
public class JoueurController {
    @Autowired
    private JoueurService joueurService;

   /* @GetMapping(value = "/getJoueur")
    public List<Joueur> vueJoueur(){
        return joueurservice.findAllJoueurByPseudo();
    }*/

    @PostMapping(value ="/createJoueur")
    public Joueur creationJoueur(){
        return joueurService.createJoueur("max", "silver", 24, "F", "Pau");
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
