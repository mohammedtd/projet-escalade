package club.dao;

import club.AppMain;
import club.model.Categorie;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest(classes = AppMain.class)
@Transactional
class CategorieDaoTest {

    @Autowired
    private CategorieDAO categorieDAO;


    @Test
    void recupererToutesLesCategories() {
        assertFalse(categorieDAO.findAll().isEmpty());
    }

    @Test
    void enregistrerUneCategorie() {
        Categorie categorie = new Categorie();
        categorie.setCategorieName("Escalade sportive");

        Categorie saved = categorieDAO.save(categorie);

        assertNotNull(saved);
        assertNotNull(saved.getCategorieID());

        Categorie found = categorieDAO.findById(saved.getCategorieID());

        assertNotNull(found);
        assertEquals("Escalade sportive", found.getCategorieName());
    }

    @Test
    void recupererUneCategorieAvecSesSorties() {
        Categorie categorie = categorieDAO.findAll().stream()
            .findFirst()
            .orElseThrow();

        Categorie found = categorieDAO.findByIdWithSorties(categorie.getCategorieID());

        assertNotNull(found);
        assertNotNull(found.getSorties());
        assertFalse(found.getSorties().isEmpty());
    }

    @Test
    void supprimerUneCategorie() {
        Categorie categorie = new Categorie();
        categorie.setCategorieName("Categorie a supprimer");
        Categorie saved = categorieDAO.save(categorie);

        categorieDAO.deleteById(saved.getCategorieID());

        Categorie found = categorieDAO.findById(saved.getCategorieID());
        assertNull(found);
    }
}
