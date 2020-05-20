package com.example.Belote.controller;


import com.example.Belote.DAO.Repository.JoueurRepository;
import com.example.Belote.DAO.Repository.PartieRepository;
import com.example.Belote.DAO.Service.Partie.PartieService;
import com.example.Belote.POJO.Joueur;
import com.example.Belote.POJO.Partie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PartieController {

    @Autowired
    private PartieService partieService;
    @Autowired
    private PartieRepository partieRepository;
    @Autowired
    private JoueurRepository joueurRepository;

    //Page d'une partie
    // Page d'accueil
    @PostMapping(value = {"/partie"})
    public String partie(HttpServletRequest request){
        HttpSession session = request.getSession();
        String j1 = (String) session.getAttribute("pseudo");
        String j2 = (String) request.getParameter("J2");
        String j3 = (String) request.getParameter("J3");
        String j4 = (String) request.getParameter("J4");

        session.setAttribute("J2",j2);
        session.setAttribute("J3",j3);
        session.setAttribute("J4",j4);
        session.setAttribute("partie", partieService.createPartie(j1, j2, j3, j4));
        //request.setAttribute("partie", partieService.createPartie(j1, j2, j3, j4));
        return ("partie");
    }

    @RequestMapping(value = {"/partieTerminee"},method = RequestMethod.POST)
    public String finPartie(HttpServletRequest request) {
        System.out.println("paskc");
        HttpSession session = request.getSession();

        String pseudoj1 = (String) session.getAttribute("pseudo");
        String pseudoj2 = (String) session.getAttribute("J2");
        String pseudoj3 = (String) session.getAttribute("J3");
        String pseudoj4 = (String) session.getAttribute("J4");

        Joueur j1 = joueurRepository.findJoueurByPseudoJ(pseudoj1);
        Joueur j2 = joueurRepository.findJoueurByPseudoJ(pseudoj2);
        Joueur j3 = joueurRepository.findJoueurByPseudoJ(pseudoj3);
        Joueur j4 = joueurRepository.findJoueurByPseudoJ(pseudoj4);

        //Ajoute une partie jouée aux joueurs qui ont fini la partie.
        j1.setNbPartieJ(j1.getNbPartieJ() + 1);
        j2.setNbPartieJ(j2.getNbPartieJ() + 1);
        j3.setNbPartieJ(j3.getNbPartieJ() + 1);
        j4.setNbPartieJ(j4.getNbPartieJ() + 1);



        //Récupère les gagnants de la partie
        String gagnant1 = (String) request.getParameter("gagnant1");
        String gagnant2 = (String) request.getParameter("gagnant2");
        if (gagnant1.equals("j1") && gagnant2.equals("j3")) {
            j1.setNbVictoireJ(j1.getNbVictoireJ() + 1);
            j3.setNbVictoireJ(j3.getNbVictoireJ() + 1);
        }
        else{
            j2.setNbVictoireJ(j2.getNbVictoireJ() + 1);
            j4.setNbVictoireJ(j4.getNbVictoireJ() + 1);
        }

        //Modifier le pourcentage de victoires
        j1.setNbMoyenneJ(j1.getNbVictoireJ()/j1.getNbPartieJ());
        j2.setNbMoyenneJ(j2.getNbVictoireJ()/j2.getNbPartieJ());
        j3.setNbMoyenneJ(j3.getNbVictoireJ()/j3.getNbPartieJ());
        j4.setNbMoyenneJ(j4.getNbVictoireJ()/j4.getNbPartieJ());



        //Modifie le score moyen
        String score1 = (String) request.getParameter("scoreEquipe1");
        String score2 = (String) request.getParameter("scoreEquipe2");
        Partie partie = (Partie) session.getAttribute("partie");
        System.out.println("le score est : "+score1);
        System.out.println("le gagnant est:"+gagnant1);
        partie.setScoreEq1Final(Integer.parseInt(score1));
        partie.setScoreEq2Final(Integer.parseInt(score2));

        long scoreMoyen1 =(j1.getScoreMoyenJ()*j1.getNbPartieJ()+Integer.parseInt(score1))/(j1.getNbPartieJ()+1);
        long scoreMoyen2 =(j2.getScoreMoyenJ()*j2.getNbPartieJ()+Integer.parseInt(score2))/(j2.getNbPartieJ()+1);
        long scoreMoyen3 =(j3.getScoreMoyenJ()*j3.getNbPartieJ()+Integer.parseInt(score1))/(j3.getNbPartieJ()+1);
        long scoreMoyen4 =(j4.getScoreMoyenJ()*j4.getNbPartieJ()+Integer.parseInt(score2))/(j4.getNbPartieJ()+1);

        j1.setScoreMoyenJ(scoreMoyen1);
        j2.setScoreMoyenJ(scoreMoyen2);
        j3.setScoreMoyenJ(scoreMoyen3);
        j4.setScoreMoyenJ(scoreMoyen4);

        joueurRepository.save(j1);
        joueurRepository.save(j2);
        joueurRepository.save(j3);
        joueurRepository.save(j4);
        partieRepository.save(partie);
        System.out.println("Pseudo du J1 : "+j1.getPseudoJ());
        System.out.println("Gagnant numéro 1 : "+gagnant1);
        System.out.println("Nombre partie du j1 :"+j1.getNbPartieJ());
        System.out.println("Score de l'équipe 1 :"+partie.getScoreEq1Final());

        return ("partieTerminee");
    }

    @GetMapping(value ="/distribuer")
    public void distribuer(){
        System.out.println("cc");
    }

    @PostMapping(value ="/createPartie")
    public Partie creationPartie(){
        return partieService.createPartie("VassDK", "toto", "max", "jack");
    }
    @GetMapping(value ="/readPartie")
    public Partie lirePartie(){
        return partieService.readPartie(1);
    }

    @PutMapping(value ="/updatePartie")
    public Partie majPartie(){
        return partieService.updatePartie(1, 100, 1000);
    }

    @DeleteMapping(value ="/deletePartie")
    public void effacerPartie(){
        partieService.deletePartie(1);
    }
}
