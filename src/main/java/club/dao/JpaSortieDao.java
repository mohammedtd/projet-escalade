package club.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Repository;

import club.model.Sortie;
import club.repository.SortieRepository;

@Repository
public class JpaSortieDao implements SortieDAO  {
    
    private final SortieRepository sortieRepository;

    public JpaSortieDao(SortieRepository sortieRepository) {
        this.sortieRepository = sortieRepository;
    }

    @Override
    public List<Sortie> findAll() {
        return sortieRepository.findAllByOrderBySortieIDDesc();
    }

    @Override
    public Sortie findById(long id) {
        return sortieRepository.findById(id).orElse(null);
    }

    @Override
    public Sortie save(Sortie sortie) {
        return sortieRepository.save(sortie);
    }

    @Override
    public void delete(long id) {
        sortieRepository.deleteById(id);
    }

    @Override
    public List<Sortie> search(String nom, Long categorieId, Long createurId, LocalDate dateSortie) {
        return sortieRepository.search(nom, categorieId, createurId, dateSortie);
    }

}
