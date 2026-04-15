package repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Membre;

public interface MembreRepository extends JpaRepository<Membre, Integer>{

}
