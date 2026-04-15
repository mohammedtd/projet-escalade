package dao;

import java.util.List;

import model.Membre;

public interface MembreDAO {    
    
    List<Membre> findAll();

    Membre findById(long id);

    Membre save(Membre membre);

    void delete(long id);

    Membre findByIdWithSorties(long id);


}
