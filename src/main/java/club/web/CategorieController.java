package club.web;

import org.springframework.stereotype.Controller;

import club.model.Categorie;
import org.springframework.ui.Model;
import club.service.CategorieService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/categories")
public class CategorieController {
    private final CategorieService categorieService;

    public CategorieController(CategorieService categorieService) {
        this.categorieService = categorieService;
    }

    /*@GetMapping
    public List<Categorie> getAll() {
        return categorieService.getAllCategories();
    }
    
    @GetMapping("/{id}")
    public Categorie getCatById(@PathVariable Integer id) {
        return categorieService.getCategorieById(id);
    }*/
    
    /*@PostMapping
    public Categorie save(@RequestBody Categorie categorie) {
        return categorieService.createCategorie(categorie);
    }*/

   /* @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {
        categorieService.delete(id);
    }*/

    @GetMapping
    public String listCategories(Model model) {

        model.addAttribute("categories", categorieService.getAllCategories());

        return "categories"; // JSP
    }

    @GetMapping("/{id}")
    public String detailCategorie(@PathVariable Integer id, Model model) {

        Categorie categorie = categorieService.getCategorieById(id);

        model.addAttribute("categorie", categorie);
        model.addAttribute("sorties", categorie.getSorties());

        return "sortieCategorie"; // JSP
    }

}


