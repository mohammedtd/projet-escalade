package club.web;

import club.service.CategorieService;
import club.model.Membre;
import club.service.MembreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import club.model.Sortie;
import club.service.SortieService;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.time.LocalDate;
import java.util.Optional;

@Controller
public class SortieController {
    private final SortieService sortieService;
    private final CategorieService categorieService ;
    private final MembreService membreService;

    public SortieController(SortieService sortieService, CategorieService categorieService, MembreService membreService) {
        this.sortieService = sortieService;
        this.categorieService=categorieService;
        this.membreService = membreService;
    }

    @GetMapping("/sorties")
    public String listSorties(Model model) {
        model.addAttribute("sorties", sortieService.getAllSorties());
        return "sortie";
    }
    @GetMapping("/sorties/{id}")
    public String detailSortie(@PathVariable Long id, Model model, Principal principal) {
        Sortie sortie = sortieService.getSortie(id);
        model.addAttribute("sortie", sortie);

        if (principal != null && sortie != null) {
            Optional<Membre> membreOpt = membreService.findByEmail(principal.getName());
            if (membreOpt.isPresent()) {
                Membre membre = membreOpt.get();
                model.addAttribute("estInscrit", sortieService.estInscrit(sortie, membre));
            }
        }

        return "detailSortie";
    }

    @PostMapping("/sorties/{id}/rejoindre")
    public String rejoindreSortie(@PathVariable Long id, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }

        Sortie sortie = sortieService.getSortie(id);
        Optional<Membre> membreOpt = membreService.findByEmail(principal.getName());

        if (membreOpt.isPresent()) {
            sortieService.rejoindreSortie(sortie, membreOpt.get());
        }

        return "redirect:/sorties/" + id;
    }

    @PostMapping("/sorties/{id}/quitter")
    public String quitterSortie(@PathVariable Long id, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }

        Sortie sortie = sortieService.getSortie(id);
        Optional<Membre> membreOpt = membreService.findByEmail(principal.getName());

        if (membreOpt.isPresent()) {
            sortieService.quitterSortie(sortie, membreOpt.get());
        } 

        return "redirect:/sorties/" + id;
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

        model.addAttribute("categories", categorieService.getAllCategories());

        model.addAttribute("nom", nom);
        model.addAttribute("categorieId", categorieId);
        model.addAttribute("createurId", createurId);
        model.addAttribute("dateSortie", dateSortie);
        return "resultatRecherche";
    }
}