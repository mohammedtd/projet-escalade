package club.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Repository;

import club.model.Membre;
import club.repository.MembreRepository;

@Repository
public class JpaMembreDAO implements MembreDAO {

    private MembreRepository membreRepository;

    public JpaMembreDAO(MembreRepository membreRepository) {
        this.membreRepository = membreRepository;
    }

    @Override
    public List<Membre> findAll() {
        return membreRepository.findAll();
    }

    @Override
    public Membre findById(long id) {
        return membreRepository.findById(id).orElse(null);
    }

    @Override
    public Membre save(Membre membre) {
        return membreRepository.save(membre);
    }

    @Override
    public void delete(long id) {
        membreRepository.deleteById(id);
    }

    @Override
    public Membre findByIdWithSorties(long id){
        return membreRepository.findByIdWithSorties(id);
    }

    @Override
    public Optional<Membre> findByEmail(String email) {
        return membreRepository.findByEmail(email);
    }



}
