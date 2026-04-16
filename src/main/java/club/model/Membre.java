package club.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@Entity
public class Membre {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long membreID;
    @NotEmpty
    private String nom;
    @NotEmpty
    private String prenom;
    @NotEmpty
    @Email
    private String email;
    @NotEmpty
    private String  motDePasse;

    @JsonIgnore
    @OneToMany(mappedBy = "createur")
    private List<Sortie> sorties;

}
