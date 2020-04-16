package com.example.Belote.DAO.Service.Partie;

import com.example.Belote.DAO.Repository.JoueurRepository;
import com.example.Belote.DAO.Repository.PartieRepository;
import com.example.Belote.POJO.Joueur;
import com.example.Belote.POJO.Partie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PartieServiceImpl implements PartieService {
    @Autowired
    private PartieRepository partieRepository;
    @Autowired
    private JoueurRepository joueurRepository;

    Joueur j1 = new Joueur();
    Joueur j2 = new Joueur();
    Joueur j3 = new Joueur();
    Joueur j4 = new Joueur();


    @Override
    public Partie createPartie(String pseudo1, String pseudo2, String pseudo3, String pseudo4) { //POST pour créer une partie

        j1 = joueurRepository.findJoueurByPseudoJ(pseudo1);
        j2 = joueurRepository.findJoueurByPseudoJ(pseudo2);
        j3 = joueurRepository.findJoueurByPseudoJ(pseudo3);
        j4 = joueurRepository.findJoueurByPseudoJ(pseudo4);

        Partie p = new Partie();

        List<Joueur> joueurList = new ArrayList<Joueur>();
        joueurList.add(j1);
        joueurList.add(j2);
        joueurList.add(j3);
        joueurList.add(j4);
        p.setJoueurs(joueurList);
        return partieRepository.save(p);
    }

    @Override
    public Partie readPartie(int id) { //GET cette fonction permet de montrer les joueurs et le score des équipes
        return partieRepository.findPartieByIdP(id);
    }

    @Override
    public Partie updatePartie(int id, int score1, int score2) { //PUT pour la modification d'une partie (à la fin de la partie mettre les scores)
        Partie p = partieRepository.findPartieByIdP(id);
        p.setScoreEq1Final(score1);
        p.setScoreEq2Final(score2);
        return partieRepository.save(p);
    }

    @Override
    public void deletePartie(int id) { //DELETE pour supprimer une partie
        Partie p =  partieRepository.findPartieByIdP(id);
        partieRepository.delete(p);
    }
}
