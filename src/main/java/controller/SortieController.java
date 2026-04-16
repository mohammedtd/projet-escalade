package controller;

import java.time.LocalDate;
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
    public List<Sortie> search(
            @RequestParam(required = false) String nom,
            @RequestParam(required = false) Integer categorieId,
            @RequestParam(required = false) Long createurId,
            @RequestParam(required = false) LocalDate dateSortie) {
        return sortieService.search(nom, categorieId, createurId, dateSortie);
    }

}
