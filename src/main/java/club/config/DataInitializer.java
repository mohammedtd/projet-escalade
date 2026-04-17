package club.config;

import java.time.LocalDate;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import club.model.Categorie;
import club.model.Membre;
import club.model.Sortie;
import club.service.CategorieService;
import club.service.MembreService;
import club.service.SortieService;

@Component
public class DataInitializer implements CommandLineRunner {

  private final CategorieService categorieService;
  private final MembreService membreService;
  private final SortieService sortieService;
  private final PasswordEncoder passwordEncoder;


  public DataInitializer(CategorieService categorieService,
                         MembreService membreService,
                         SortieService sortieService,
                         PasswordEncoder passwordEncoder) {
    this.categorieService = categorieService;
    this.membreService = membreService;
    this.sortieService = sortieService;
    this.passwordEncoder = passwordEncoder;

  }





  @Override
  public void run(String... args) {
    System.out.println("=== Initialisation démarrée ===");

    if (!categorieService.getAllCategories().isEmpty()) {
      System.out.println("=== Base déjà initialisée ===");
      return;
    }

    Categorie c1 = new Categorie();
    c1.setCategorieName("Escalade sportive");
    c1 = categorieService.createCategorie(c1);

    Categorie c2 = new Categorie();
    c2.setCategorieName("Alpinisme");
    c2 = categorieService.createCategorie(c2);


    Membre m1 = new Membre();
    m1.setNom("Dupont");
    m1.setPrenom("Jean");
    m1.setEmail("jean@test.com");
    m1.setMotDePasse(passwordEncoder.encode("1234"));
    m1 = membreService.saveMembre(m1);

    Membre m2 = new Membre();
    m2.setNom("Martin");
    m2.setPrenom("Alice");
    m2.setEmail("alice@test.com");
    m2.setMotDePasse(passwordEncoder.encode("1234"));
    m2 = membreService.saveMembre(m2);



    Sortie s1 = new Sortie();
    s1.setNomSortie("Sortie Calanques");
    s1.setDescription("Escalade en bord de mer");
    s1.setDateSortie(LocalDate.now());
    s1.setCategorie(c1);
    s1.setCreateur(m1);
    sortieService.saveSortie(s1);

    Sortie s2 = new Sortie();
    s2.setNomSortie("Sortie Mont Blanc");
    s2.setDescription("Alpinisme en haute montagne");
    s2.setDateSortie(LocalDate.now().plusDays(5));
    s2.setCategorie(c2);
    s2.setCreateur(m2);
    sortieService.saveSortie(s2);

    System.out.println("=== Données initialisées ===");
    System.out.println("=== Nb catégories : " + categorieService.getAllCategories().size() + " ===");
  }
}