package club.web.security;


import club.repository.MembreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
public class SpringSecurity {

  @Autowired
  MembreRepository membreRepo;

  @Bean
  WebSecurityCustomizer webSecurityCustomizer() {
    return (web) -> {
      web.ignoring().requestMatchers("/webjars/**");
    };
  }

  @Bean
  SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    String[] anonymousRequests = { "/", //
        "/login", //
        "/categories", //
        "/categories", //
        "/categories/**", //
        "/sorties/**",  //
    };

    String[] adminRequests = { //
         //
    };

    http.authorizeHttpRequests(config -> {//
      config.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll();
      // Pour tous
      config.requestMatchers(anonymousRequests).permitAll();//
      // Pour les admins
      config.requestMatchers(adminRequests).hasAnyAuthority("ROLE_MEMBER");//
      // Pour les autres
      config.anyRequest().authenticated();
    });
    // Nous autorisons un formulaire de login
    http.formLogin(config -> {
      config.permitAll();
    });
    // Nous autorisons un formulaire de logout
    http.logout(config -> {
      config.permitAll();
      config.logoutSuccessUrl("/");
    });
    // Nous activons CSRF pour les actions protégées
    http.csrf(config -> {
      config.ignoringRequestMatchers(anonymousRequests);
    });
    return http.build();
  }

  @Bean
  public AuthenticationProvider myAuthenticationProvider(
      PasswordEncoder encoder,
      UserDetailsService userDetailsService) {

    DaoAuthenticationProvider authProvider =
        new DaoAuthenticationProvider(userDetailsService);

    authProvider.setPasswordEncoder(encoder);

    return authProvider;
  }

  /*
   * Définir la politique par défaut pour le cryptage des mots de passe.
   */
  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }


}
