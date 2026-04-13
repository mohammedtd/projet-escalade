package projet_club_escalade.service;

import java.util.List;

import org.springframework.stereotype.Service;

import projet_club_escalade.dao.MembreDAO;
import projet_club_escalade.model.Membre;

@Service
public class MembreService {
    
    private final MembreDAO membreDAO;

    public MembreService(MembreDAO membreDAO) {
        this.membreDAO = membreDAO;
    }

    // Obtenir la liste des membres
    public List<Membre> getAllMembres () {
        return membreDAO.findAll();
    }

    // Obtenir un membre
    public Membre getMembreById (Integer id) {
        return membreDAO.findById(id);
    }

    // Créer / Modifier un membre
    public Membre saveMembre(Membre membre) {
        return membreDAO.save(membre);
    }

    // Supprimer un membre
    public void delete(Integer id) {
        membreDAO.delete(id);
    }

}
