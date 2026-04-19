package club.dao;

import java.util.Optional;

import club.model.PasswordResetToken;

public interface TokenDAO {

    PasswordResetToken save(PasswordResetToken token);

    Optional<PasswordResetToken> findByToken(String token);

    void delete(PasswordResetToken token);
}
