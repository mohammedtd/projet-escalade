package club.service;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.stereotype.Service;

import club.dao.TokenDAO;
import club.model.Membre;
import club.model.PasswordResetToken;

@Service
public class PasswordResetTokenService {

    private final TokenDAO tokenDAO;

    public PasswordResetTokenService(TokenDAO tokenDAO) {
        this.tokenDAO = tokenDAO;
    }

    public void createToken(Membre membre, String token) {
        PasswordResetToken resetToken = new PasswordResetToken();
        resetToken.setToken(token);
        resetToken.setMembre(membre);
        resetToken.setExpirationDate(LocalDateTime.now().plusMinutes(30));

        tokenDAO.save(resetToken);
    }

    public boolean isValid(String token) {
        Optional<PasswordResetToken> tokenOpt = tokenDAO.findByToken(token);

        if (tokenOpt.isEmpty()) {
            return false;
        }

        PasswordResetToken resetToken = tokenOpt.get();
        return resetToken.getExpirationDate().isAfter(LocalDateTime.now());
    }

    public Membre getMembreByToken(String token) {
        PasswordResetToken resetToken = tokenDAO.findByToken(token)
            .orElseThrow(() -> new RuntimeException("Token introuvable"));

        return resetToken.getMembre();
    }

    public void invalidate(String token) {
        tokenDAO.findByToken(token)
            .ifPresent(tokenDAO::delete);
    }
}
