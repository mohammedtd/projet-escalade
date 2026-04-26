package club.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Optional;
import java.util.UUID;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import club.AppMain;
import club.model.Membre;



@SpringBootTest(classes = AppMain.class)
@Transactional
class MembreDaoTest {

    @Autowired
    private MembreDAO membreDAO;


    @Test
    void recupererTousLesMembres() {
        assertFalse(membreDAO.findAll().isEmpty());
    }

    @Test
    void enregistrerUnMembre() {
        String suffixe = UUID.randomUUID().toString();

        Membre membre = new Membre();
        membre.setNom("Dupont");
        membre.setPrenom("Lea");
        membre.setEmail("lea." + suffixe + "@test.com");
        membre.setMotDePasse("1234");

        Membre saved = membreDAO.save(membre);

        assertNotNull(saved.getMembreID());
        assertEquals("Dupont", membreDAO.findById(saved.getMembreID()).getNom());
    }

    @Test
    void recupererUnMembreParSonIdentifiant() {
        String suffixe = UUID.randomUUID().toString();

        Membre membre = new Membre();
        membre.setNom("Petit");
        membre.setPrenom("Lina");
        membre.setEmail("lina." + suffixe + "@test.com");
        membre.setMotDePasse("1234");
        Membre saved = membreDAO.save(membre);

        Membre found = membreDAO.findById(saved.getMembreID());

        assertNotNull(found);
        assertEquals(saved.getMembreID(), found.getMembreID());
        assertEquals("Petit", found.getNom());
        assertEquals("Lina", found.getPrenom());
    }

    @Test
    void retrouverUnMembreParEmail() {
        String suffixe = UUID.randomUUID().toString();

        Membre membre = new Membre();
        membre.setNom("Martin");
        membre.setPrenom("Ines");
        membre.setEmail("ines." + suffixe + "@test.com");
        membre.setMotDePasse("1234");
        membreDAO.save(membre);

        Optional<Membre> found = membreDAO.findByEmail(membre.getEmail());

        assertTrue(found.isPresent());
        assertEquals(membre.getEmail(), found.get().getEmail());
    }

    @Test
    void recupererUnMembreAvecSesSorties() {
        Membre membre = membreDAO.findAll().stream()
            .findFirst()
            .orElseThrow();

        Membre found = membreDAO.findByIdWithSorties(membre.getMembreID());

        assertNotNull(found);
        assertNotNull(found.getSorties());
        assertFalse(found.getSorties().isEmpty());
    }
}
