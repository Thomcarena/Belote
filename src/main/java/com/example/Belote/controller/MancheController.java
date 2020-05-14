package com.example.Belote.controller;

import com.example.Belote.DAO.Repository.PartieRepository;
import com.example.Belote.DAO.Service.Manche.MancheService;
import com.example.Belote.POJO.Manche;
import com.example.Belote.POJO.Partie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MancheController {
    @Autowired
    private MancheService mancheService;


    @PostMapping(value ="/createManche")
    public Manche creationManche(){
        return mancheService.createManche("Trèfle", 1);
    }

    @GetMapping(value ="/readManche")
    public Manche lireJoueur(){
        return mancheService.readManche(1);
    }

    @PutMapping(value ="/updateManche")
    public Manche majJoueur(){
        return mancheService.updateManche(1, 100, 200);
    }

    @DeleteMapping(value ="/deleteManche")
    public void effacerManche(){
        mancheService.deleteManche(2);
    }
}
