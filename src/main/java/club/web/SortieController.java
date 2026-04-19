package club.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import club.model.Sortie;
import club.service.SortieService;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;

@Controller
public class SortieController {
    private final SortieService sortieService;
    public SortieController(SortieService sortieService) {
        this.sortieService = sortieService;
    }

    @GetMapping("/sorties")
    public String listSorties(Model model) {
        model.addAttribute("sorties", sortieService.getAllSorties());
        return "sortie";
    }
    @GetMapping("/sorties/{id}")
    public String detailSortie(@PathVariable Long id, Model model) {
        Sortie sortie = sortieService.getSortie(id);
        model.addAttribute("sortie", sortie);
        return "detailSortie";
    }

    @GetMapping("/sorties/search")
    public String search(
        @RequestParam(required = false) String nom,
        @RequestParam(required = false) Long categorieId,
        @RequestParam(required = false) Long createurId,
        @RequestParam(required = false) LocalDate dateSortie,
        Model model) {

        if (nom != null && nom.trim().isEmpty()) {
            nom = null;
        }

        model.addAttribute("sorties",
            sortieService.search(nom, categorieId, createurId, dateSortie));

        return "resultatRecherche";
    }
}