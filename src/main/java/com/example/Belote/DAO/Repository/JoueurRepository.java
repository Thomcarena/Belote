/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Belote.DAO.Repository;


import com.example.Belote.POJO.Joueur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 * @author thomas
 */
@Repository
public interface JoueurRepository extends JpaRepository<Joueur, Integer>{
    //JPA recherche dans la bdd la table Joueur avec pour pk son id

    Joueur findJoueurByPseudoJAndMdpJ(String pseudo, String mdp);
    Joueur findJoueurByPseudoJ(String pseudo);
    @Override
    List<Joueur> findAll();
}
