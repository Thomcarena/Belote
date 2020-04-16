package com.example.Belote.DAO.Service.Partie;

import com.example.Belote.POJO.Partie;

public interface PartieService {
    Partie createPartie(String pseudo1, String pseudo2, String pseudo3, String pseudo4);
    Partie readPartie(int id);
    Partie updatePartie(int id, int score1, int score2);
    void deletePartie(int id);
}
