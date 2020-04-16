package com.example.Belote.DAO.Repository;


import com.example.Belote.POJO.Manche;
import com.example.Belote.POJO.Partie;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MancheRepository extends JpaRepository<Manche, Integer> {
    Manche findMancheByIdM(int id);
}
