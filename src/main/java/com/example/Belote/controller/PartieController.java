package com.example.Belote.controller;


import com.example.Belote.DAO.Service.Partie.PartieService;
import com.example.Belote.POJO.Partie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class PartieController {

    @Autowired
    private PartieService partieService;


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
        partieService.deletePartie(2);
    }
}
