package dao;

import java.util.List;

import model.Sortie;

public interface SortieDAO {

    List<Sortie> findAll();

    Sortie findById(Integer id);

    Sortie save(Sortie sortie);

    void delete(Integer id);

    List<Sortie> searchByNom(String motCle);

    List<Sortie> searchByLieu(String lieu);

    List<Sortie> searchByCategorie(Integer categorieId);
}
