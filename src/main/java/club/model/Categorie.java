package club.model;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Data
@NoArgsConstructor
public class Categorie {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long categorieID;
    @NotEmpty
    private String categorieName;

    @JsonIgnore
    @OneToMany(mappedBy = "categorie")
    private List<Sortie> sorties;

}
