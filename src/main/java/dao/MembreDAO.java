package dao;

import java.util.List;

import model.Membre;

public interface MembreDAO {    
    
    List<Membre> findAll();

    Membre findById(Integer id);

    Membre save(Membre membre);

    void delete(Integer id);

}
