package projet_club_escalade.dao;

import java.util.List;

import projet_club_escalade.model.Membre;

public interface MembreDAO {    
    
    List<Membre> findAll();

    Membre findById(Integer id);

    Membre save(Membre membre);

}
