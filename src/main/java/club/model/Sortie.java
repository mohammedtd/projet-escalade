package club.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity

public class Sortie {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long sortieID;

    @NotBlank(message = "Le nom est obligatoire")
    @NotEmpty
    private String nomSortie;

    @NotBlank(message = "Le nom est obligatoire")
    private String description;

    private String siteWeb;

    @NotNull(message = "La date est obligatoire")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateSortie;


    @ManyToOne
    @JoinColumn(name = "createur_id")
    @NotNull
    private Membre createur;


    @ManyToOne
    @JoinColumn(name = "categorie_id")
    @NotNull(message = "La categorie est obligatoire")    
    private Categorie categorie;



}
