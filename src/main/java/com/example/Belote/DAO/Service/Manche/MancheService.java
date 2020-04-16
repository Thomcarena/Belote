package com.example.Belote.DAO.Service.Manche;

import com.example.Belote.POJO.Manche;
import com.example.Belote.POJO.Partie;

public interface MancheService {
    Manche createManche(String atout, int idP);
    Manche readManche(int idM);
    Manche updateManche(int idM, int score1, int score2);
    void deleteManche(int idM);

}
