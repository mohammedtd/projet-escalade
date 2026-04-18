package club.web;

import club.dao.CategorieDAO;
import club.service.CategorieService;
import club.service.MembreService;
import club.service.SortieService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AccueilController {

  private final CategorieService categorieService;
  private final SortieService sortieService;
  private final MembreService membreService;
  public AccueilController(CategorieService categorieService,
                           SortieService sortieService,
                           MembreService membreService) {

    this.categorieService = categorieService;
    this.sortieService = sortieService;
    this.membreService = membreService;
  }

  @GetMapping("/")
  public String accueil() {
    return "accueil";
  }

  @GetMapping("/home")
  public String home(Model model) {
    model.addAttribute("categories", categorieService.getAllCategories());
    model.addAttribute("sorties", sortieService.getAllSorties());
    model.addAttribute("membres", membreService.getAllMembres());
    return "home";
  }




}