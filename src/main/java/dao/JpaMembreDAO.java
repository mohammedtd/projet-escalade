package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.Membre;
import repository.MembreRepository;

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


}
