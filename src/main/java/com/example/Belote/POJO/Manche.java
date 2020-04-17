package com.example.Belote.POJO;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Set;

@Entity
@Table(name = "Manche")
public class Manche {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idM;
    int scoreEq1;
    int scoreEq2;
    String Atout;
    @OneToMany(mappedBy="manche", cascade = CascadeType.REMOVE)
    private Set<Pli> plis;
    @ManyToOne
    private Partie partie;



    public Manche() {
    }

    public Manche(int idM, int scoreEq1, int scoreEq2, String Atout, Set<Pli> plis, Partie partie) {
        this.idM = idM;
        this.scoreEq1 = scoreEq1;
        this.scoreEq2 = scoreEq2;
        this.Atout = Atout;
        this.plis = plis;
        this.partie = partie;
    }

    public int getIdM() {
        return idM;
    }

    public void setIdM(int idM) {
        this.idM = idM;
    }

    public int getScoreEq1() {
        return scoreEq1;
    }

    public void setScoreEq1(int scoreEq1) {
        this.scoreEq1 = scoreEq1;
    }

    public int getScoreEq2() {
        return scoreEq2;
    }

    public void setScoreEq2(int scoreEq2) {
        this.scoreEq2 = scoreEq2;
    }

    public String getAtout() {
        return Atout;
    }

    public void setAtout(String atout) {
        Atout = atout;
    }

    public Set<Pli> getPlis() {
        return plis;
    }

    public void setPlis(Set<Pli> plis) {
        this.plis = plis;
    }

    public Partie getPartie() {
        return partie;
    }

    public void setPartie(Partie partie) {
        this.partie = partie;
    }
}
