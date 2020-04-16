package com.example.Belote.DAO.Service.Pli;

import com.example.Belote.DAO.Repository.CarteRepository;
import com.example.Belote.DAO.Repository.MancheRepository;
import com.example.Belote.DAO.Repository.PliRepository;
import com.example.Belote.POJO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PliServiceImpl implements PliService {
    @Autowired
    private PliRepository pliRepository;
    @Autowired
    private CarteRepository carteRepository;
    @Autowired
    private MancheRepository mancheRepository;

    Carte c1 = new Carte();
    Carte c2 = new Carte();
    Carte c3 = new Carte();
    Carte c4 = new Carte();

    @Override
    public Pli createPli(int id1, int id2, int id3, int id4, int idM) {

        c1 = carteRepository.findCarteByIdC(id1);
        c2 = carteRepository.findCarteByIdC(id2);
        c3 = carteRepository.findCarteByIdC(id3);
        c4 = carteRepository.findCarteByIdC(id4);

        Pli p = new Pli();
        Manche m = mancheRepository.findMancheByIdM(idM);

        List<Carte> carteList = new ArrayList<Carte>();
        carteList.add(c1);
        carteList.add(c2);
        carteList.add(c3);
        carteList.add(c4);
        p.setCartes(carteList);
        p.setManche(m);
        return pliRepository.save(p);
    }

    @Override
    public Pli readPli(int id) { //GET cette fonction permet de montrer les joueurs et le score des équipes
        return pliRepository.findPliByIdPli(id);
    }

    @Override
    public Pli updatePli(int idC, int position, int idP) { //PUT pour la modification d'une partie (à la fin de la partie mettre les scores)

        Carte c = carteRepository.findCarteByIdC(idC);
        Pli pli = pliRepository.findPliByIdPli(idP);

        List<Carte> carteList = new ArrayList<Carte>();
        carteList = pli.getCartes();
        carteList.set(position, c);


        return pliRepository.save(pli);
    }

    @Override
    public void deletePli(int id) { //DELETE pour supprimer une partie
        Pli pli = pliRepository.findPliByIdPli(id);
        pliRepository.delete(pli);
    }
}
