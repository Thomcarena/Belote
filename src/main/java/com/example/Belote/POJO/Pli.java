package com.example.Belote.POJO;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.List;
import java.util.Set;


@Entity
@Table(name = "Pli")
public class Pli {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPli;
    @ManyToMany
    private List<Carte> cartes;
    @ManyToOne
    private Manche manche;


    public Pli() {
    }

    public Pli(int idPli, List<Carte> cartes, Manche manche) {
        this.idPli = idPli;
        this.cartes = cartes;
        this.manche = manche;
    }

    public int getIdPli() {
        return idPli;
    }

    public void setIdPli(int idPli) {
        this.idPli = idPli;
    }

    public List<Carte> getCartes() {
        return cartes;
    }

    public void setCartes(List<Carte> cartes) {
        this.cartes = cartes;
    }

    public Manche getManche() {
        return manche;
    }

    public void setManche(Manche manche) {
        this.manche = manche;
    }
}
