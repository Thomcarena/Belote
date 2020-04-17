/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.Belote.POJO;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.List;

/**
 * @author thomas
 */
@Entity
@Table(name = "Joueur")
public class Joueur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idJ;
    private String pseudoJ;
    String mdpJ;
    int ageJ;
    String sexeJ;
    String villeJ;
    int nbPartieJ;
    int nbVictoireJ;
    long nbMoyenneJ;
    long scoreMoyenJ;
    @OneToMany(mappedBy="joueur")
    private List<Carte> cartes;
    @ManyToMany(mappedBy="joueurs")
    private List<Partie> parties;


    public Joueur() {
    }

    public Joueur(int idJ, String pseudoJ, String mdpJ, int ageJ, String sexeJ, String villeJ) {
        this.idJ = idJ;
        this.pseudoJ = pseudoJ;
        this.mdpJ = mdpJ;
        this.ageJ = ageJ;
        this.sexeJ = sexeJ;
        this.villeJ = villeJ;
    }

    public int getIdJ() {
        return idJ;
    }

    public void setIdJ(int idJ) {
        this.idJ = idJ;
    }

    public String getPseudoJ() {
        return pseudoJ;
    }

    public void setPseudoJ(String pseudoJ) {
        this.pseudoJ = pseudoJ;
    }

    public String getMdpJ() {
        return mdpJ;
    }

    public void setMdpJ(String mdpJ) {
        this.mdpJ = mdpJ;
    }

    public int getAgeJ() {
        return ageJ;
    }

    public void setAgeJ(int ageJ) {
        this.ageJ = ageJ;
    }

    public String getSexeJ() {
        return sexeJ;
    }

    public void setSexeJ(String sexeJ) {
        this.sexeJ = sexeJ;
    }

    public String getVilleJ() {
        return villeJ;
    }

    public void setVilleJ(String villeJ) {
        this.villeJ = villeJ;
    }

    public List<Carte> getCartes() {
        return cartes;
    }

    public void setCartes(List<Carte> cartes) {
        this.cartes = cartes;
    }

    public List<Partie> getParties() {
        return parties;
    }

    public void setParties(List<Partie> parties) {
        this.parties = parties;
    }

    public int getNbPartieJ() {
        return nbPartieJ;
    }

    public void setNbPartieJ(int nbPartieJ) {
        this.nbPartieJ = nbPartieJ;
    }

    public int getNbVictoireJ() {
        return nbVictoireJ;
    }

    public void setNbVictoireJ(int nbVictoireJ) {
        this.nbVictoireJ = nbVictoireJ;
    }

    public long getNbMoyenneJ() {
        return nbMoyenneJ;
    }

    public void setNbMoyenneJ(long nbMoyenneJ) {
        this.nbMoyenneJ = nbMoyenneJ;
    }

    public long getScoreMoyenJ() {
        return scoreMoyenJ;
    }

    public void setScoreMoyenJ(long scoreMoyenJ) {
        this.scoreMoyenJ = scoreMoyenJ;
    }

    public void ajoutScoreMoyenJoueur(long score){
        long newScore = (this.scoreMoyenJ * this.nbPartieJ + score ) / (this.nbPartieJ + 1);
        this.scoreMoyenJ = newScore;
    }
}