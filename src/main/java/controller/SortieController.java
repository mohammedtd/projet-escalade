package controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import model.Sortie;
import service.SortieService;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("/sorties")
public class SortieController {
    private final SortieService sortieService;

    public SortieController(SortieService sortieService) {
        this.sortieService = sortieService;
    }

    @GetMapping
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
    public List<Sortie> searchByName(@RequestParam String motCle) {
        return sortieService.searchByNom(motCle);
    }

    @GetMapping("/lieu")
    public List<Sortie> searchByLieu(@RequestParam String motCle) {
        return sortieService.searchByLieu(motCle);
    }

    @GetMapping("/categorie")
    public List<Sortie> searchByCategorie(@RequestParam Integer categorieId) {
        return sortieService.searchByCategorie(categorieId);
    }

}
