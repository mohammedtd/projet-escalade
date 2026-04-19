package club.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    private final JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void envoyerMailReset(String toEmail, String token) {

        String lien = "http://localhost:9090/reset-password?token=" + token;

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Réinitialisation mot de passe");
        message.setText("Clique ici pour changer ton mot de passe : " + lien);

        mailSender.send(message);
    }
}
