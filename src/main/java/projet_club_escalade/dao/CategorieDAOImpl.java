package projet_club_escalade.dao;

import java.util.List;

import projet_club_escalade.model.Categorie;
import projet_club_escalade.repository.CategorieRepository;

public class CategorieDAOImpl implements CategorieDAO{
    
    private CategorieRepository categorieRepository;

    @Override
    public List<Categorie> findAll() {
        return categorieRepository.findAll();
    }

    @Override
    public Categorie findById(Integer id) {
        return categorieRepository.findById(id).orElse(null);
    }

    @Override
    public Categorie save(Categorie categorie) {
        return categorieRepository.save(categorie);
    }

    @Override
    public void delete(Integer id) {
        categorieRepository.deleteById(id);
    }
}
