package club.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import club.dao.CategorieDAO;
import club.model.Categorie;

@Service
public class CategorieService {

    @Autowired
    private CategorieDAO categorieDAO;
    

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
        categorieDAO.deleteById(id);
    }

    public Categorie findByIdWithSorties(long id) {
        return categorieDAO.findByIdWithSorties(id);
    }

}
