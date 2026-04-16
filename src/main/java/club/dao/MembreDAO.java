package club.dao;

import java.util.List;

import club.model.Membre;

public interface MembreDAO {    
    
    List<Membre> findAll();

    Membre findById(long id);

    Membre save(Membre membre);

    void delete(long id);

    Membre findByIdWithSorties(long id);


}
