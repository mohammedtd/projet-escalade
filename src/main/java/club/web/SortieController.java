package club.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import club.model.Sortie;
import club.service.SortieService;

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
}