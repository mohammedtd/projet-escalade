package club.config;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
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
  private static final int POURCENTAGE_CREATEURS = 70;

  private final CategorieService categorieService;
  private final MembreService membreService;
  private final SortieService sortieService;
  private final PasswordEncoder passwordEncoder;
  private final int nbCategories;
  private final int nbMembres;
  private final int nbSorties;

  public DataInitializer(CategorieService categorieService,
                         MembreService membreService,
                         SortieService sortieService,
                         PasswordEncoder passwordEncoder,
                         @Value("${app.data.categories:30}") int nbCategories,
                         @Value("${app.data.membres:250}") int nbMembres,
                         @Value("${app.data.sorties:4000}") int nbSorties) {
    this.categorieService = categorieService;
    this.membreService = membreService;
    this.sortieService = sortieService;
    this.passwordEncoder = passwordEncoder;
    this.nbCategories = nbCategories;
    this.nbMembres = nbMembres;
    this.nbSorties = nbSorties;
  }

  @Override
  public void run(String... args) {
    System.out.println("=== Initialisation démarrée ===");

    if (!categorieService.getAllCategories().isEmpty()) {
      System.out.println("=== Base déjà initialisée ===");
      return;
    }

    List<Categorie> categories = creerCategories();
    List<Membre> membres = creerMembres();
    creerSorties(categories, membres);

  int nbCreateurs = Math.max(1, (membres.size() * POURCENTAGE_CREATEURS) / 100);
  int nbNonCreateurs = Math.max(0, membres.size() - nbCreateurs);

    System.out.println("=== Données initialisées ===");
    System.out.println("=== Nb catégories : " + categorieService.getAllCategories().size() + " ===");
    System.out.println("=== Nb membres : " + membreService.getAllMembres().size() + " ===");
    System.out.println("=== Nb sorties : " + sortieService.getAllSorties().size() + " ===");
  System.out.println("=== Nb membres créateurs : " + nbCreateurs + " ===");
  System.out.println("=== Nb membres non créateurs : " + nbNonCreateurs + " ===");
  }

  private List<Categorie> creerCategories() {
    String[] disciplines = {
        "Escalade sportive",
        "Alpinisme",
        "Bloc",
        "Grande voie",
        "Via ferrata",
        "Randonnée alpine",
        "Escalade indoor",
        "Initiation falaise",
        "Cascade de glace",
        "Perfectionnement technique"
    };
    String[] variantes = {
        "Decouverte",
        "Avancee",
        "Panoramique",
        "Nature",
        "Technique",
        "Collective"
    };

    List<Categorie> categories = new ArrayList<>();

    for (int i = 0; i < nbCategories; i++) {
      Categorie categorie = new Categorie();
      String nom = i < disciplines.length
          ? disciplines[i]
          : disciplines[i % disciplines.length] + " " + variantes[(i / disciplines.length) % variantes.length];
      categorie.setCategorieName(nom);
      categories.add(categorieService.createCategorie(categorie));
    }

    return categories;
  }

  private List<Membre> creerMembres() {
    String[] prenoms = {
        "Jean", "Alice", "Sophie", "Lucas", "Ines", "Yanis", "Nora", "Hugo", "Lea", "Mehdi",
        "Sarah", "Adam", "Jade", "Rayan", "Clara", "Louis", "Camille", "Noah", "Lina", "Tom"
    };
    String[] noms = {
        "Dupont", "Martin", "Durand", "Petit", "Robert", "Moreau", "Garcia", "Bernard", "Thomas", "Richard",
        "Diallo", "Roux", "Laurent", "Simon", "Michel", "Leroy", "Andre", "Marchand", "Faure", "Mercier"
    };

    List<Membre> membres = new ArrayList<>();

    for (int i = 0; i < nbMembres; i++) {
      Membre membre = new Membre();
      membre.setPrenom(prenoms[i % prenoms.length]);
      membre.setNom(noms[i % noms.length] + "-" + noms[(i / noms.length) % noms.length]);
      membre.setEmail("membre" + (i + 1) + "@club.test");
      membre.setMotDePasse(passwordEncoder.encode("1234"));
      membres.add(membreService.saveMembre(membre));
    }

    return membres;
  }

  private void creerSorties(List<Categorie> categories, List<Membre> membres) {
    String[] lieux = {
        "Calanques", "Verdon", "Chamonix", "Fontainebleau", "Ceuse",
        "Annecy", "Vercors", "Ecrins", "Ardeche", "Ailefroide"
    };
    String[] styles = {
        "initiation", "technique", "decouverte", "perfectionnement", "falaise",
        "montagne", "encadree", "collective", "sportive", "panoramique"
    };
    String[] rythmes = {
        "du matin", "du week-end", "du club", "de printemps", "d'altitude",
        "en pleine nature", "de progression", "entre membres", "sur roche", "en exterieur"
    };
    String[] formats = {
        "Aventure", "Cap Vertical", "Evasion", "Horizons", "Ascension",
        "Traversee", "Falaises", "Sommets", "Rochers", "Passerelle"
    };

    int nbCreateurs = Math.max(1, (membres.size() * POURCENTAGE_CREATEURS) / 100);

    for (int i = 0; i < nbSorties; i++) {
      Categorie categorie = categories.get(i % categories.size());
      Membre createur = membres.get(i % nbCreateurs);

      Sortie sortie = new Sortie();
      sortie.setNomSortie(formats[i % formats.length] + " " + lieux[(i / formats.length) % lieux.length]
          + " " + rythmes[(i / (formats.length * lieux.length)) % rythmes.length]);
      sortie.setDescription(
          "Sortie " + styles[i % styles.length] + " organisee par le club dans la categorie "
              + categorie.getCategorieName().toLowerCase() + ".");
      sortie.setDateSortie(LocalDate.now().plusDays(i % 365));
      sortie.setCategorie(categorie);
      sortie.setCreateur(createur);
      sortie.setSiteWeb("https://club-escalade.test/sorties/" + (i + 1));

      sortieService.saveSortie(sortie);
    }
  }
}
