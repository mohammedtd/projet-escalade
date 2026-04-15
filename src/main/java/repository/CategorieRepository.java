package repository;

import model.Sortie;
import org.springframework.data.jpa.repository.JpaRepository;

import model.Categorie;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface CategorieRepository extends JpaRepository<Categorie, Long> {
  @Query("SELECT c FROM Categorie c LEFT JOIN FETCH c.sorties WHERE c.categorieID = :id")
  Categorie findByIdWithSorties(@Param("id") long id);
}
