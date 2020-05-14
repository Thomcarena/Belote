package com.example.Belote.controller;

import com.example.Belote.DAO.Service.Partie.PartieService;
import com.example.Belote.DAO.Service.Pli.PliService;
import com.example.Belote.POJO.Partie;
import com.example.Belote.POJO.Pli;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class PliController {

    @Autowired
    private PliService pliService;

    @PostMapping(value ="/createPli")
    public Pli creationPli(){
        return pliService.createPli(1, 2, 3, 4,1);
    }

    @GetMapping(value ="/readPli")
    public Pli lirePartie(){
        return pliService.readPli(1);
    }

    @PutMapping(value ="/updatePli")
    public Pli majPartie(){
        return pliService.updatePli(5, 1, 1);
    }

    @DeleteMapping(value ="/deletePli")
    public void effacerPli(){
        pliService.deletePli(1);
    }
}
