package dao;

import java.time.LocalDate;
import java.util.List;

import model.Sortie;

public interface SortieDAO {

    List<Sortie> findAll();

    Sortie findById(long id);

    Sortie save(Sortie sortie);

    void delete(long id);

    List<Sortie> search(String nom, Integer categorieId, Long createurId, LocalDate dateSortie);

}
