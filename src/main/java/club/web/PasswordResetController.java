package club.web;

import java.util.Optional;
import java.util.UUID;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.ui.Model;
import club.model.Membre;
import club.service.EmailService;
import club.service.MembreService;
import club.service.PasswordResetTokenService;

@Controller
public class PasswordResetController {

    private final MembreService membreService;
    private final EmailService emailService;
    private final PasswordResetTokenService passwordResetTokenService;
    private final PasswordEncoder passwordEncoder;


    public PasswordResetController( MembreService membreService,
                                    EmailService emailService,
                                    PasswordResetTokenService passwordResetTokenService,
                                    PasswordEncoder passwordEncoder)  {
        this.membreService = membreService;
        this.emailService = emailService;
        this.passwordResetTokenService = passwordResetTokenService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm(){
        return "forgotPassword";
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam String email, Model model){
        Optional<Membre> membreOpt = membreService.findByEmail(email);

        if (membreOpt.isPresent()) {
            Membre membre = membreOpt.get();

            String token = UUID.randomUUID().toString();

            passwordResetTokenService.createToken(membre, token);

            emailService.envoyerMailReset(membre.getEmail(), token);

        }

        model.addAttribute("message", "Si le compte existe, un email a ete envoye.");
    
        return "forgotPassword";
    }


    @GetMapping("/reset-password")
    public String showResetPasswordForm(@RequestParam String token, Model model) {
        if (!passwordResetTokenService.isValid(token)) {
            model.addAttribute("erreur", "Lien invalide ou expire");
            return "forgotPassword";
        }

        model.addAttribute("token", token);
        return "resetPassword";
    }


    @PostMapping("/reset-password")
    public String processResetPassword(
        @RequestParam String token,
        @RequestParam String nouveauMotDePasse,
        Model model) {

        if (!passwordResetTokenService.isValid(token)) {
            model.addAttribute("erreur", "Lien invalide ou expire");
            return "resetPassword";
        }

        Membre membre = passwordResetTokenService.getMembreByToken(token);

        membre.setMotDePasse(passwordEncoder.encode(nouveauMotDePasse));
        membreService.saveMembre(membre);

        passwordResetTokenService.invalidate(token);

        return "redirect:/login";
    }

}
