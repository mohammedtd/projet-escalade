package web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Membre;
import service.MembreService;

@Controller
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
