package service;

import java.util.List;

import org.springframework.stereotype.Service;

import dao.SortieDAO;
import model.Sortie;

@Service
public class SortieService {

    private final SortieDAO sortieDAO;

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

    // Chercher des sorties en fonction de critères
    public List<Sortie> searchByNom(String motCle) {
        return sortieDAO.searchByNom(motCle);
    }

    public List<Sortie> searchByLieu(String lieu) {
        return sortieDAO.searchByLieu(lieu);
    }

    public List<Sortie> searchByCategorie(Integer categorieId) {
        return sortieDAO.searchByCategorie(categorieId);
    }
}
