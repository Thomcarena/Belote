/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Belote.DAO.Service.Joueur;

import com.example.Belote.DAO.Repository.JoueurRepository;
import com.example.Belote.POJO.Joueur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * @author thoma
 */
@Service
public class JoueurServiceImpl implements JoueurService {
    @Autowired
    private JoueurRepository joueurRepository;

    @Override
    public Joueur createJoueur(String pseudo, String mdp, int age, String sexe, String ville) { //POST car on récupère des données du front (formulaire) pour les mettre dans la bdd
        Joueur j = new Joueur();
        j.setPseudoJ(pseudo);
        j.setMdpJ(mdp);
        j.setAgeJ(age);
        j.setSexeJ(sexe);
        j.setVilleJ(ville);

       return joueurRepository.save(j);
    }

    @Override
    public Joueur readJoueur(String pseudo, String mdp) { //GET cette fonction permet de vérifier les id et mdp pour se connecter
        return joueurRepository.findJoueurByPseudoJAndMdpJ(pseudo, mdp);
    }

    @Override
    public List<Joueur> getAllJoueurs() { //GET cette fonction permet de vérifier les id et mdp pour se connecter
        return joueurRepository.findAll();
    }

    @Override
    public Joueur updateJoueur(String pseudo, String mdp, int age, String sexe, String ville, int nbPartie, int nbVictoire, long score) { //PUT pour la modification de compte
        Joueur j = joueurRepository.findJoueurByPseudoJ(pseudo);
        j.setMdpJ(mdp);
        j.setAgeJ(age);
        j.setSexeJ(sexe);
        j.setVilleJ(ville);
        j.setNbPartieJ(nbPartie);
        j.setNbVictoireJ(nbVictoire);
        j.setNbMoyenneJ(j.getNbVictoireJ()/j.getNbPartieJ());
        j.ajoutScoreMoyenJoueur(score);
        return joueurRepository.save(j);
    }

    @Override
    public Joueur updateJoueur(String pseudo, String mdp, int age, String sexe, String ville) { //PUT pour la modification de compte
        Joueur j = joueurRepository.findJoueurByPseudoJ(pseudo);
        j.setMdpJ(mdp);
        j.setAgeJ(age);
        j.setSexeJ(sexe);
        j.setVilleJ(ville);
        return joueurRepository.save(j);
    }

    @Override
    public void deleteJoueur(String pseudo) { //DELETE pour supprimer un compte
        Joueur j = joueurRepository.findJoueurByPseudoJ(pseudo);
        joueurRepository.delete(j);
    }

}
