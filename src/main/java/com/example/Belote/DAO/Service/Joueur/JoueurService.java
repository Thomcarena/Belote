/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Belote.DAO.Service.Joueur;

import com.example.Belote.POJO.Joueur;

/**
 *
 * @author Vassili & Thomas
 */

//Liste des méthodes
public interface JoueurService {
    Joueur createJoueur(String pseudo, String mdp, int age, String sexe, String ville);
    Joueur readJoueur(String pseudo, String mdp);
    Joueur updateJoueur(String pseudo, String mdp, int age, String sexe, String ville);
    void deleteJoueur(String pseudo);
}
