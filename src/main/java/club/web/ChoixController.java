package club.web;

import java.security.Principal;
import java.util.Optional;

import club.service.CategorieService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import club.model.Membre;
import club.model.Sortie;
import club.service.MembreService;
import club.service.SortieService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChoixController {
  private final MembreService membreService;
  private final SortieService sortieService;
  private final CategorieService categorieService;

  public ChoixController(MembreService membreService, SortieService sortieService, CategorieService categorieService) {
    this.membreService = membreService;
    this.sortieService = sortieService;
    this.categorieService=categorieService;
  }
  @GetMapping("/choix")
  public String mesSorties(Model model, Principal principal) {
    String email = principal.getName();
    Optional<Membre> membreOpt = membreService.findByEmail(email);
    if (membreOpt.isPresent()) {

      Membre membre = membreOpt.get();

      model.addAttribute("membre", membre);
      model.addAttribute("sorties", membre.getSorties());
    }

    return "choix";
  }

  @PostMapping("/choix/supprimer/{id}")
  public String supprimerSortie(@PathVariable Long id, Principal principal) {
    String email = principal.getName();
    Optional<Membre> membreOpt = membreService.findByEmail(email);
    if (membreOpt.isPresent()) {
      Membre membre = membreOpt.get();
      Sortie sortie = sortieService.getSortie(id);
      if (sortie.getCreateur() != null &&
          sortie.getCreateur().getMembreID() == membre.getMembreID()) {

        sortieService.deleteSortie(id);
      }
    }
    return "redirect:/choix";
  }

  @GetMapping("/choix/ajouter")
  public String formAjouter(Model model) {
    model.addAttribute("categories", categorieService.getAllCategories());
    return "formSortie";
  }

  @PostMapping("/choix/ajouter")
  public String ajouterSortie(
      @RequestParam String nomSortie,
      @RequestParam String description,
      @RequestParam(required = false) String siteWeb,
      @RequestParam String dateSortie,
      @RequestParam Long categorieId,
      Principal principal) {

    String email = principal.getName();
    Membre membre = membreService.findByEmail(email).get();

    Sortie sortie = new Sortie();

    sortie.setNomSortie(nomSortie);
    sortie.setDescription(description);
    sortie.setSiteWeb(siteWeb);
    sortie.setDateSortie(java.time.LocalDate.parse(dateSortie));
    sortie.setCategorie(categorieService.getCategorieById(categorieId));
    sortie.setCreateur(membre);

    sortieService.saveSortie(sortie);

    return "redirect:/choix";
  }

  @GetMapping("/choix/modifier/{id}")
  public String formModifier(@PathVariable Long id, Model model) {
    Sortie sortie = sortieService.getSortie(id);
    model.addAttribute("sortie", sortie);
    model.addAttribute("categories", categorieService.getAllCategories());

    return "formSortie";
  }

  @PostMapping("/choix/modifier/{id}")
  public String modifierSortie(
      @PathVariable Long id,
      @RequestParam String nomSortie,
      @RequestParam String description,
      @RequestParam(required = false) String siteWeb,
      @RequestParam String dateSortie,
      @RequestParam Long categorieId) {

    Sortie sortie = sortieService.getSortie(id);

    sortie.setNomSortie(nomSortie);
    sortie.setDescription(description);
    sortie.setSiteWeb(siteWeb);
    sortie.setDateSortie(java.time.LocalDate.parse(dateSortie));
    sortie.setCategorie(categorieService.getCategorieById(categorieId));

    sortieService.saveSortie(sortie);

    return "redirect:/choix";
  }
}