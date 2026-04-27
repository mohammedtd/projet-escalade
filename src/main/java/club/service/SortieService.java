package club.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import club.dao.SortieDAO;
import club.model.Membre;
import club.model.Sortie;

@Service
public class SortieService {

    @Autowired
    private SortieDAO sortieDAO;

    public SortieService(SortieDAO sortieDAO) {
        this.sortieDAO = sortieDAO;
    }

    // Obtenir la liste des sorties
    public List<Sortie> getAllSorties() {
        return sortieDAO.findAll();
    }

    // Obtenir les détails d'une sortie 
    public Sortie getSortie(long id) {
        return sortieDAO.findById(id);
    }

    // Créer, modifier une sortie
    public Sortie saveSortie(Sortie sortie) {
        return sortieDAO.save(sortie);
    }

    // Supprimer une sortie
    public void deleteSortie(long id) {
        sortieDAO.delete(id);
    }

    public List<Sortie> search(String nom, Long categorieId, Long createurId, LocalDate dateSortie) {
        return sortieDAO.search(nom, categorieId, createurId, dateSortie);
    }

    public boolean estInscrit(Sortie sortie, Membre membre) {
        if (sortie == null || membre == null || sortie.getMembres() == null) {
            return false;
        }
        return sortie.getMembres().stream()
            .anyMatch(m -> m.getMembreID() == membre.getMembreID());
    }

    public void rejoindreSortie(Sortie sortie, Membre membre) {
        if (sortie == null || membre == null) {
            return;
        }

        List<Membre> participants = sortie.getMembres();
        if (participants == null) {
            participants = new ArrayList<>();
            sortie.setMembres(participants);
        }

        if (!estInscrit(sortie, membre)) {
            participants.add(membre);
            sortieDAO.save(sortie);
        }
    }

    public void quitterSortie(Sortie sortie, Membre membre) {
        if (sortie == null || membre == null || sortie.getMembres() == null) {
            return;
        }

        boolean removed = sortie.getMembres().removeIf(m -> m.getMembreID() == membre.getMembreID());
        if (removed) {
            sortieDAO.save(sortie);
        }
    }
}
