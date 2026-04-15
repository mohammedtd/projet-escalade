package repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Sortie;

public interface SortieRepository extends JpaRepository<Sortie, Integer> {

    // Chercher les sorties en fonction de critères
    
    List<Sortie> findByNomSortieContaining(String motCle);

    List<Sortie> findByLieuContaining(String lieu);

    List<Sortie> findByCategorie_CategorieID(Integer categorieID);
}
