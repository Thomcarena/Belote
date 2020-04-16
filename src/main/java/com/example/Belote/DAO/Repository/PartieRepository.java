package com.example.Belote.DAO.Repository;
import com.example.Belote.POJO.Partie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PartieRepository extends JpaRepository<Partie, Integer> {
    Partie findPartieByIdP(int id);
}
