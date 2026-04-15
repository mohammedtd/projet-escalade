package dao;

import java.util.List;

import model.Categorie;

public interface CategorieDAO {
    
    List<Categorie> findAll();

    Categorie findById(Integer id);

    Categorie save(Categorie categorie);

    void delete(Integer id);
    
}
