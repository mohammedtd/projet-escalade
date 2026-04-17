package club.web.security;

import club.model.Membre;
import club.repository.MembreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyMembreDetailsService implements UserDetailsService {

  @Autowired
  private MembreRepository memberRepository;


  @Override
  public UserDetails loadUserByUsername(String username) {
    Membre membre = memberRepository.findByEmail(username)
        .orElseThrow(() -> new UsernameNotFoundException("Membre non trouvé"));
    return User.withUsername(membre.getEmail())
        .password(membre.getMotDePasse())
        .authorities("ROLE_MEMBER")
        .disabled(false)
        .accountExpired(false)
        .accountLocked(false)
        .credentialsExpired(false)
        .build();
  }
}
