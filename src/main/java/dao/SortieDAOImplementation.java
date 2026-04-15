package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.Sortie;
import repository.SortieRepository;

@Repository
public class SortieDAOImplementation implements SortieDAO  {
    
    private final SortieRepository sortieRepository;

    public SortieDAOImplementation(SortieRepository sortieRepository) {
        this.sortieRepository = sortieRepository;
    }

    @Override
    public List<Sortie> findAll() {
        return sortieRepository.findAll();
    }

    @Override
    public Sortie findById(Integer id) {
        return sortieRepository.findById(id).orElse(null);
    }

    @Override
    public Sortie save(Sortie sortie) {
        return sortieRepository.save(sortie);
    }

    @Override
    public void delete(Integer id) {
        sortieRepository.deleteById(id);
    }

    @Override
    public List<Sortie> searchByNom(String motCle) {
        return sortieRepository.findByNomSortieContaining(motCle);
    }

    @Override
    public List<Sortie> searchByLieu(String lieu) {
        return sortieRepository.findByLieuContaining(lieu);
    }

    @Override
    public List<Sortie> searchByCategorie(Integer categorieId) {
        return sortieRepository.findByCategorie_CategorieID(categorieId);
    }
}
