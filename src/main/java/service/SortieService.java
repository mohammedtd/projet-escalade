package service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SortieDAO;
import model.Sortie;

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
    public Sortie getSortie(Integer id) {
        return sortieDAO.findById(id);
    }

    // Créer, modifier une sortie
    public Sortie saveSortie(Sortie sortie) {
        return sortieDAO.save(sortie);
    }

    // Supprimer une sortie
    public void deleteSortie(Integer id) {
        sortieDAO.delete(id);
    }

    public List<Sortie> search(String nom, Integer categorieId, Long createurId, LocalDate dateSortie) {
        return sortieDAO.search(nom, categorieId, createurId, dateSortie);
    }
}
