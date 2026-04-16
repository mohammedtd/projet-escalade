package repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Categorie;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CategorieRepository extends JpaRepository<Categorie, Long> {
  @Query("SELECT c FROM Categorie c LEFT JOIN FETCH c.sorties WHERE c.categorieID = :id")
  Categorie findByIdWithSorties(@Param("id") long id);
}
