package com.example.Belote.DAO.Repository;

import com.example.Belote.POJO.Carte;
import com.example.Belote.POJO.Joueur;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarteRepository extends JpaRepository<Carte, Integer> {
    Carte findCarteByIdC(int id);
}
