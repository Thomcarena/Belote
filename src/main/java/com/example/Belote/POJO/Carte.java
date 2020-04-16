package com.example.Belote.POJO;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.List;
import java.util.Set;


@Entity
@Table(name = "Carte")
public class Carte {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idC;
    String couleurC;
    String valeurC;
    @ManyToOne
    private Joueur joueur;
    @ManyToMany(mappedBy = "cartes")
    private List<Pli> plis;


    public Carte() {
    }

    public Carte(int idC, String couleurC, String valeurC) {
        this.idC = idC;
        this.couleurC = couleurC;
        this.valeurC = valeurC;
    }

    public int getIdC() {
        return idC;
    }

    public void setIdC(int idC) {
        this.idC = idC;
    }

    public String getCouleurC() {
        return couleurC;
    }

    public void setCouleurC(String couleurC) {
        this.couleurC = couleurC;
    }

    public String getValeurC() {
        return valeurC;
    }

    public void setValeurC(String valeurC) {
        this.valeurC = valeurC;
    }

    public Joueur getJoueur() {
        return joueur;
    }

    public void setJoueur(Joueur joueur) {
        this.joueur = joueur;
    }

    public List<Pli> getPlis() {
        return plis;
    }

    public void setPlis(List<Pli> plis) {
        this.plis = plis;
    }
}
