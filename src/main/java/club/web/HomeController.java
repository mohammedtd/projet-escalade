package club.web;

import club.dao.CategorieDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
  private final CategorieDAO categorieDAO;

  public HomeController(CategorieDAO categorieDAO) {
    this.categorieDAO = categorieDAO;
  }

  @GetMapping("/home")
  public String home(Model model) {
    return "home";
  }

  @GetMapping("/categories")
  public String visitCategorie(Model model) {
    return "categories";
  }


  @GetMapping("/sortie")
  public String visitSortie(Model model) {
    return "sortie";
  }

  @GetMapping("/createur")
  public String visitCreateur(Model model) {
    return "createur";
  }

  @GetMapping("/choix")
  public String visitChoix(Model model) {
    return "choix";
  }
}
