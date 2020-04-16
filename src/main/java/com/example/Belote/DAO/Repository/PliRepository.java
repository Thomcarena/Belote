package com.example.Belote.DAO.Repository;

import com.example.Belote.POJO.Partie;
import com.example.Belote.POJO.Pli;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PliRepository  extends JpaRepository<Pli, Integer> {

    Pli findPliByIdPli(int id);
}
