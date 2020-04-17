package com.example.Belote.POJO;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.List;
import java.util.Set;

/**
 * @author thomas
 */
@Entity
@Table(name = "Partie")
public class Partie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idP;
    @ManyToMany
    private List<Joueur> joueurs;
    int scoreEq1Final;
    int scoreEq2Final;
    @OneToMany(mappedBy="partie", cascade = CascadeType.REMOVE)
    private Set<Manche> manches;


    public Partie() {
    }

    public Partie(int idP, List<Joueur> joueurs, int scoreEq1Final, int scoreEq2Final, Set<Manche> manches) {
        this.idP = idP;
        this.joueurs = joueurs;
        this.scoreEq1Final = scoreEq1Final;
        this.scoreEq2Final = scoreEq2Final;
        this.manches = manches;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public List<Joueur> getJoueurs() {
        return joueurs;
    }

    public void setJoueurs(List<Joueur> joueurs) {
        this.joueurs = joueurs;
    }

    public int getScoreEq1Final() {
        return scoreEq1Final;
    }

    public void setScoreEq1Final(int scoreEq1Final) {
        this.scoreEq1Final = scoreEq1Final;
    }

    public int getScoreEq2Final() {
        return scoreEq2Final;
    }

    public void setScoreEq2Final(int scoreEq2Final) {
        this.scoreEq2Final = scoreEq2Final;
    }

    public Set<Manche> getManches() {
        return manches;
    }

    public void setManches(Set<Manche> manches) {
        this.manches = manches;
    }
}

