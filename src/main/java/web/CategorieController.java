package web;

import org.springframework.stereotype.Controller;

import model.Categorie;
import service.CategorieService;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/categories")
public class CategorieController {
    private final CategorieService categorieService;

    public CategorieController(CategorieService categorieService) {
        this.categorieService = categorieService;
    }

    @GetMapping
    public List<Categorie> getAll() {
        return categorieService.getAllCategories();
    }
    
    @GetMapping("/{id}")
    public Categorie getCatById(@PathVariable Integer id) {
        return categorieService.getCategorieById(id);
    }
    
    @PostMapping
    public Categorie save(@RequestBody Categorie categorie) {
        return categorieService.createCategorie(categorie);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {
        categorieService.delete(id);
    }
}
