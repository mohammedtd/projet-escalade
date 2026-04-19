package club.dao;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import club.model.PasswordResetToken;
import club.repository.PasswordResetTokenRepository;

@Repository
public class JpaTokenDao implements TokenDAO {

    private final PasswordResetTokenRepository passwordResetTokenRepository;

    public JpaTokenDao(PasswordResetTokenRepository passwordResetTokenRepository) {
        this.passwordResetTokenRepository = passwordResetTokenRepository;
    }

    @Override
    public PasswordResetToken save(PasswordResetToken token) {
        return passwordResetTokenRepository.save(token);
    }

    @Override
    public Optional<PasswordResetToken> findByToken(String token) {
        return passwordResetTokenRepository.findByToken(token);
    }

    @Override
    public void delete(PasswordResetToken token) {
        passwordResetTokenRepository.delete(token);
    }
}
