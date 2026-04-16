package club.web;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import club.model.Sortie;
import club.service.CategorieService;
import club.service.SortieService;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/sorties")
public class SortieController {
    private final SortieService sortieService;
    private final CategorieService categorieService;


    public SortieController(SortieService sortieService, CategorieService categorieService) {
        this.sortieService = sortieService;
        this.categorieService = categorieService;

    }

    /*@GetMapping
    public List<Sortie> getAll() {
        return sortieService.getAllSorties();
    }

    @GetMapping("/{id}")
    public Sortie getById(@PathVariable Integer id) {
        return sortieService.getSortie(id);
    }

    @PostMapping
    public Sortie save(@RequestBody Sortie sortie) {
        return sortieService.saveSortie(sortie);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {
        sortieService.deleteSortie(id);
    }

    @GetMapping("/search")
    public List<Sortie> search(
            @RequestParam(required = false) String nom,
            @RequestParam(required = false) Integer categorieId,
            @RequestParam(required = false) Long createurId,
            @RequestParam(required = false) LocalDate dateSortie) {
        return sortieService.search(nom, categorieId, createurId, dateSortie);
    }*/

    @GetMapping("/{id}")
    public String getById(@PathVariable Integer id, Model model) {
        Sortie sortie = sortieService.getSortie(id);
        model.addAttribute("sortie", sortie);
        return "detailSortie";
    }

    @GetMapping("/search")
    public String search(
        @RequestParam(required = false) String nom,
        @RequestParam(required = false) Integer categorieId,
        @RequestParam(required = false) Long createurId,
        @RequestParam(required = false) LocalDate dateSortie,
        Model model) {


        if (nom != null && nom.trim().isEmpty()) {
            nom = null;
        }

        model.addAttribute("sorties", sortieService.search(nom, categorieId, createurId, dateSortie));
        model.addAttribute("categories", categorieService.getAllCategories());

        model.addAttribute("nom", nom);
        model.addAttribute("categorieId", categorieId);
        model.addAttribute("createurId", createurId);
        model.addAttribute("dateSortie", dateSortie);

        return "resultatRecherche";
    }
}

