package projet_club_escalade.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import projet_club_escalade.model.Membre;

public interface MembreRepository extends JpaRepository<Membre, Integer>{

}
