package projet_club_escalade.dao;

import java.util.List;

import projet_club_escalade.model.Categorie;

public interface CategorieDAO {
    
    List<Categorie> findAll();

    Categorie findById(Integer id);

    Categorie save(Categorie categorie);

    void delete(Integer id);
    
}
