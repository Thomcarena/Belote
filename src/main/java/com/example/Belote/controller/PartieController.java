package com.example.Belote.controller;


import com.example.Belote.DAO.Service.Partie.PartieService;
import com.example.Belote.POJO.Joueur;
import com.example.Belote.POJO.Partie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class PartieController {

    @Autowired
    private PartieService partieService;

    //Page d'une partie
    // Page d'accueil
    @PostMapping(value = {"/partie"})
    public String partie(HttpServletRequest request){
        HttpSession session = request.getSession();
        String j1 = (String) session.getAttribute("pseudo");
        String j2 = (String) request.getParameter("J2");
        String j3 = (String) request.getParameter("J3");
        String j4 = (String) request.getParameter("J4");
        //request.setAttribute("partie", partieService.createPartie(j1, j2, j3, j4));
        return ("partie");
    }

    @GetMapping(value ="/distribuer")
    public void distribuer(){
        System.out.println("cc");
    }

    @PostMapping(value ="/createPartie")
    public Partie creationPartie(){
        return partieService.createPartie("VassDK", "toto", "max", "jack");
    }
    @GetMapping(value ="/readPartie")
    public Partie lirePartie(){
        return partieService.readPartie(1);
    }

    @PutMapping(value ="/updatePartie")
    public Partie majPartie(){
        return partieService.updatePartie(1, 100, 1000);
    }

    @DeleteMapping(value ="/deletePartie")
    public void effacerPartie(){
        partieService.deletePartie(1);
    }
}
