package com.example.Belote.DAO.Service.Pli;

import com.example.Belote.POJO.Pli;

public interface PliService {
    Pli createPli(int id1, int id2, int id3, int id4, int idM);
    Pli readPli(int id);
    Pli updatePli(int idC, int position, int idP);
    void deletePli(int id);
}
