package club.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import club.dao.MembreDAO;
import club.model.Membre;

@Service
public class MembreService {

    @Autowired
    private MembreDAO membreDAO;

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

    public Membre findByIdWithSorties(long id){ return membreDAO.findByIdWithSorties(id);}

    public Optional<Membre > findByEmail(String email) {
        return membreDAO.findByEmail(email);
    }

}
