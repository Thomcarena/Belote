package com.example.Belote.controller;

import com.example.Belote.DAO.Service.Joueur.JoueurService;
import com.example.Belote.POJO.Joueur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class AccueilController {
    @Autowired
    private JoueurService joueurService;

    // Page d'accueil
    @RequestMapping(value = {"/*","/accueil"}, method = RequestMethod.GET)
    public String accueil(Model model){
        return ("accueil");
    }

    // Page des statistiques
    @GetMapping(value = {"/statistiques"})
    public String stats(HttpServletRequest request){
        List<Joueur> joueurs = joueurService.getAllJoueurs();
        request.setAttribute("listeJoueurs",joueurs);
        return ("statistiques");
    }

    // Page de création d'une partie
    @GetMapping(value = {"/creationPartie"})
    public String creationPartie(HttpServletRequest request){
        List<Joueur> joueurs = joueurService.getAllJoueurs();
        request.setAttribute("listeJoueurs",joueurs);
        return ("creationPartie");
    }
}
