package club.repository;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import club.model.Sortie;
import org.springframework.data.jpa.repository.Query;

public interface SortieRepository extends JpaRepository<Sortie, Long> {
    List<Sortie> findAllByOrderBySortieIDDesc();

    @Query("""
    SELECT s FROM Sortie s
    WHERE (:nom IS NULL OR s.nomSortie LIKE CONCAT('%', :nom, '%'))
    AND (:categorieId IS NULL OR s.categorie.categorieID = :categorieId)
    AND (:createurId IS NULL OR s.createur.membreID = :createurId)
    AND (:dateSortie IS NULL OR s.dateSortie = :dateSortie)
    ORDER BY s.sortieID DESC
    """)
    List<Sortie> search(String nom, Long categorieId, Long createurId, LocalDate dateSortie);

}
