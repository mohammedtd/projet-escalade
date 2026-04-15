package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.Categorie;
import repository.CategorieRepository;

@Repository
public class JpaCategorieDao implements CategorieDAO {

  private final CategorieRepository categorieRepository;

  public JpaCategorieDao(CategorieRepository categorieRepository) {
    this.categorieRepository = categorieRepository;
  }

  @Override
  public List<Categorie> findAll() {
    return categorieRepository.findAll();
  }

  @Override
  public Categorie findById(long id) {
    return categorieRepository.findById(id).orElse(null);
  }

  @Override
  public Categorie findByIdWithSorties(long id) {
    return categorieRepository.findByIdWithSorties(id);
  }

  @Override
  public Categorie save(Categorie categorie) {
    return categorieRepository.save(categorie);
  }

  @Override
  public void deleteById(long id) {
    categorieRepository.deleteById(id);
  }
}