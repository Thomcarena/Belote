package com.example.Belote.DAO.Service.Manche;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.example.Belote.DAO.Repository.MancheRepository;
import com.example.Belote.DAO.Repository.PartieRepository;
import com.example.Belote.POJO.Joueur;
import com.example.Belote.POJO.Manche;
import com.example.Belote.POJO.Partie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author thoma
 */
@Service
public class MancheServiceImpl implements MancheService {

    @Autowired
    private MancheRepository mancheRepository;
    @Autowired
    private PartieRepository partieRepository;

    @Override
    public Manche createManche(String atout, int idP) { //POST Permet de créer une manche
        Partie p = partieRepository.findPartieByIdP(idP);
        Manche m = new Manche();
        m.setAtout(atout);
        m.setPartie(p);
        return mancheRepository.save(m);
    }

    @Override
    public Manche readManche(int idM) { //GET cette fonction permet de vérifier les id et mdp pour se connecter
        return mancheRepository.findMancheByIdM(idM);
    }

    @Override
    public Manche updateManche(int idM, int score1, int score2) { //PUT pour la modification de compte
        Manche m = mancheRepository.findMancheByIdM(idM);
        m.setScoreEq1(score1);
        m.setScoreEq2(score2);
        return mancheRepository.save(m);
    }

    @Override
    public void deleteManche(int idM) { //DELETE pour supprimer un compte
        Manche m = mancheRepository.findMancheByIdM(idM);
        mancheRepository.delete(m);
    }
}

