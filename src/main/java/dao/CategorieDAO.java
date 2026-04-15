package dao;

import java.util.List;

import model.Categorie;

public interface CategorieDAO {
    
    List<Categorie> findAll();

    Categorie findById(long id);

    Categorie save(Categorie categorie);

    void deleteById(long id);

    Categorie findByIdWithSorties(long id);
    
}
