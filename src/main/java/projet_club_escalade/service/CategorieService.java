package projet_club_escalade.service;

import java.util.List;

import org.springframework.stereotype.Service;

import projet_club_escalade.dao.CategorieDAOImpl;
import projet_club_escalade.model.Categorie;

@Service
public class CategorieService {
    
    private CategorieDAOImpl categorieDAOImpl;

    public CategorieService(CategorieDAOImpl categorieDAOImpl) {
        this.categorieDAOImpl = categorieDAOImpl;
    }

    // Obtenir la liste des catégories
    public List<Categorie> getAllCategories () {
        return categorieDAOImpl.findAll();
    }

    // Obtenir une catégorie
    public Categorie getCategorieById (Integer id) {
        return categorieDAOImpl.findById(id);
    }

    // Créer une catégorie
    public Categorie createCategorie(Categorie categorie) {
        return categorieDAOImpl.save(categorie);
    }

    //Supprimer une catégorie
    public void delete(Integer id) {
        categorieDAOImpl.delete(id);
    }

}
