package club.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import club.model.Membre;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MembreRepository extends JpaRepository<Membre, Long>{

  @Query("SELECT m FROM Membre m LEFT JOIN FETCH m.sorties WHERE m.membreID = :id")
  Membre findByIdWithSorties(@Param("id") long id);

}
