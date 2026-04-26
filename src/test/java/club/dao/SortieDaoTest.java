package club.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import club.AppMain;
import club.model.Categorie;
import club.model.Membre;
import club.model.Sortie;

@SpringBootTest(classes = AppMain.class)
@Transactional
class SortieDaoTest {

    @Autowired
    private SortieDAO sortieDAO;

    @Autowired
    private CategorieDAO categorieDAO;

    @Autowired
    private MembreDAO membreDAO;

    @Test
    void enregistrerUneSortie() {
        String suffixe = UUID.randomUUID().toString();
        Categorie categorie = creerCategorie("Bloc test " + suffixe);
        Membre membre = creerMembre("save." + suffixe + "@test.com");

        Sortie sortie = new Sortie();
        sortie.setNomSortie("Sortie save " + suffixe);
        sortie.setDescription("Description save");
        sortie.setDateSortie(LocalDate.of(2026, 6, 1));
        sortie.setCategorie(categorie);
        sortie.setCreateur(membre);

        Sortie saved = sortieDAO.save(sortie);

        assertNotNull(saved.getSortieID());
        assertEquals("Sortie save " + suffixe, sortieDAO.findById(saved.getSortieID()).getNomSortie());
    }

    @Test
    void rechercherUneSortieAvecPlusieursCriteres() {
        String suffixe = UUID.randomUUID().toString();
        Categorie categorie = creerCategorie("Alpinisme test " + suffixe);
        Membre membre = creerMembre("search." + suffixe + "@test.com");

        Sortie sortie = new Sortie();
        sortie.setNomSortie("Verdon secret " + suffixe);
        sortie.setDescription("Recherche multicritere");
        sortie.setDateSortie(LocalDate.of(2026, 7, 15));
        sortie.setCategorie(categorie);
        sortie.setCreateur(membre);
        sortieDAO.save(sortie);

        List<Sortie> resultats = sortieDAO.search(
            "Verdon secret " + suffixe,
            categorie.getCategorieID(),
            membre.getMembreID(),
            LocalDate.of(2026, 7, 15));

        assertFalse(resultats.isEmpty());
        assertTrue(resultats.stream().anyMatch(s -> s.getNomSortie().equals("Verdon secret " + suffixe)));
    }

    @Test
    void modifierUneSortie() {
        String suffixe = UUID.randomUUID().toString();
        Categorie categorie = creerCategorie("Grande voie test " + suffixe);
        Membre membre = creerMembre("update." + suffixe + "@test.com");

        Sortie sortie = new Sortie();
        sortie.setNomSortie("Sortie update " + suffixe);
        sortie.setDescription("Ancienne description");
        sortie.setDateSortie(LocalDate.of(2026, 8, 20));
        sortie.setCategorie(categorie);
        sortie.setCreateur(membre);
        sortie = sortieDAO.save(sortie);

        sortie.setDescription("Nouvelle description");
        sortieDAO.save(sortie);

        Sortie found = sortieDAO.findById(sortie.getSortieID());
        assertEquals("Nouvelle description", found.getDescription());
    }

    @Test
    void supprimerUneSortie() {
        String suffixe = UUID.randomUUID().toString();
        Categorie categorie = creerCategorie("Via ferrata test " + suffixe);
        Membre membre = creerMembre("delete." + suffixe + "@test.com");

        Sortie sortie = new Sortie();
        sortie.setNomSortie("Sortie delete " + suffixe);
        sortie.setDescription("Suppression");
        sortie.setDateSortie(LocalDate.of(2026, 9, 5));
        sortie.setCategorie(categorie);
        sortie.setCreateur(membre);
        sortie = sortieDAO.save(sortie);

        sortieDAO.delete(sortie.getSortieID());

        assertNull(sortieDAO.findById(sortie.getSortieID()));
    }

    private Categorie creerCategorie(String nom) {
        Categorie categorie = new Categorie();
        categorie.setCategorieName(nom);
        return categorieDAO.save(categorie);
    }

    private Membre creerMembre(String email) {
        Membre membre = new Membre();
        membre.setNom("Test");
        membre.setPrenom("User");
        membre.setEmail(email);
        membre.setMotDePasse("1234");
        return membreDAO.save(membre);
    }
}
