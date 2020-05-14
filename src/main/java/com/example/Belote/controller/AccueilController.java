package com.example.Belote.controller;

import com.example.Belote.POJO.Joueur;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccueilController {

    // Page d'accueil
    @RequestMapping(value = {"/*","/accueil"}, method = RequestMethod.GET)
    public String accueil(Model model){
        return ("accueil");
    }
}
