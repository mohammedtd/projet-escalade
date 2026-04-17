package club.web;

import club.dao.CategorieDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class HomeController {

  private final CategorieDAO categorieDAO;

  public HomeController(CategorieDAO categorieDAO) {
    this.categorieDAO = categorieDAO;
  }

  @GetMapping("/")
  public String home(Model model) {
    return "accueil";
  }

  @GetMapping("/home")
  public String visit(Model model) {
    return "home";
  }


}