package club.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import club.service.MembreService;

@Controller
public class CreateurController {
  private final MembreService membreService;
  public CreateurController(MembreService membreService) {
    this.membreService = membreService;
  }

  @GetMapping("/createur")
  public String listCreateurs(Model model) {
    model.addAttribute("membres", membreService.getAllMembres());
    return "createur";
  }
}