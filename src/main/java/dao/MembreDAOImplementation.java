package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.Membre;
import repository.MembreRepository;

@Repository
public class MembreDAOImplementation implements MembreDAO {

    private MembreRepository membreRepository;

    public MembreDAOImplementation(MembreRepository membreRepository) {
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

    @Override
    public void delete(Integer id) {
        membreRepository.deleteById(id);
    }
    
}
