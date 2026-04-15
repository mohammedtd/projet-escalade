package service;

import java.util.List;

import org.springframework.stereotype.Service;

import dao.CategorieDAO;
import model.Categorie;

@Service
public class CategorieService {
    
    private final CategorieDAO categorieDAO;

    public CategorieService(CategorieDAO categorieDAO) {
        this.categorieDAO = categorieDAO;
    }

    // Obtenir la liste des catégories
    public List<Categorie> getAllCategories () {
        return categorieDAO.findAll();
    }

    // Obtenir une catégorie
    public Categorie getCategorieById (Integer id) {
        return categorieDAO.findById(id);
    }

    // Créer une catégorie
    public Categorie createCategorie(Categorie categorie) {
        return categorieDAO.save(categorie);
    }

    //Supprimer une catégorie
    public void delete(Integer id) {
        categorieDAO.delete(id);
    }

}
