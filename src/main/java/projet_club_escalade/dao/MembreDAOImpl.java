package projet_club_escalade.dao;

import java.util.List;

import projet_club_escalade.model.Membre;
import projet_club_escalade.repository.MembreRepository;

public class MembreDAOImpl implements MembreDAO{

    private MembreRepository membreRepository;

    public MembreDAOImpl(MembreRepository membreRepository) {
        this.membreRepository = membreRepository;
    }

    @Override
    public List<Membre> findAll() {
        return membreRepository.findAll();
    }

    @Override
    public Membre findById(Integer id) {
        return membreRepository.findById(id).orElse(null);
    }

    @Override
    public Membre save(Membre membre) {
        return membreRepository.save(membre);
    }
    
}
