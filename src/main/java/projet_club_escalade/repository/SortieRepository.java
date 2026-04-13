package projet_club_escalade.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import projet_club_escalade.model.Sortie;

public interface SortieRepository extends JpaRepository<Sortie, Integer> {

    List<Sortie> findByNomSortieContaining(String motCle);

    List<Sortie> findByLieuContaining(String lieu);

    List<Sortie> findByCategorie_CategorieID(Integer categorieID);
}
