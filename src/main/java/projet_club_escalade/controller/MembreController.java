package projet_club_escalade.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import projet_club_escalade.model.Membre;
import projet_club_escalade.service.MembreService;

@RestController
@RequestMapping("/membres")
public class MembreController {
    
    private final MembreService membreService;

    public MembreController(MembreService membreService) {
        this.membreService = membreService;
    }

    @GetMapping
    public List<Membre> getAll() {
        return membreService.getAllMembres();
    }

    @GetMapping("/{id}")
    public Membre getById(@PathVariable Integer id) {
        return membreService.getMembreById(id);
    }

    @PostMapping
    public Membre save(@RequestBody Membre membre) {
        return membreService.saveMembre(membre);
    }
    
}
