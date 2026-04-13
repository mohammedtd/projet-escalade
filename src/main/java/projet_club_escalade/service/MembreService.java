package projet_club_escalade.service;

import java.util.List;

import org.springframework.stereotype.Service;

import projet_club_escalade.dao.MembreDAOImpl;
import projet_club_escalade.model.Membre;

@Service
public class MembreService {
    
    private MembreDAOImpl membreDAOImpl;

    public MembreService(MembreDAOImpl membreDAOImpl) {
        this.membreDAOImpl = membreDAOImpl;
    }

    // Obtenir la liste des membres
    public List<Membre> getAllMembres () {
        return membreDAOImpl.findAll();
    }

    // Obtenir un membre
    public Membre getMembreById (Integer id) {
        return membreDAOImpl.findById(id);
    }

    // Créer / Modifier un membre
    public Membre saveMembre(Membre membre) {
        return membreDAOImpl.save(membre);
    }

}
