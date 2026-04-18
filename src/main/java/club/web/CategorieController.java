package club.web;

import org.springframework.stereotype.Controller;

import club.model.Categorie;
import org.springframework.ui.Model;
import club.service.CategorieService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
public class CategorieController {

  // Service pour accéder aux catégories
  private final CategorieService categorieService;

  // Injection du service
  public CategorieController(CategorieService categorieService) {
    this.categorieService = categorieService;
  }

  @GetMapping("/categories")
  public String listCategories(Model model) {
    model.addAttribute("categories", categorieService.getAllCategories());
    return "categories";
  }

  @GetMapping("/categories/{id}")
  public String detailCategorie(@PathVariable Long id, Model model) {
    Categorie categorie = categorieService.getCategorieById(id);
    model.addAttribute("categorie", categorie);
    model.addAttribute("sorties", categorie.getSorties());
    return "sortieCategorie";
  }
}


