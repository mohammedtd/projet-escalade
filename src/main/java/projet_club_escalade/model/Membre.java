package projet_club_escalade.model;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.validation.constraints.NotEmpty;

@Entity
public class Membre {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer nomID;
    
    @NotEmpty
    private String nom;

    @NotEmpty
    private String prenom;

    private String email;

    // Relation avec Sortie
    @ManyToMany(mappedBy = "membres")
    private List<Sortie> sorties;

    public Membre() {
    }

    public Integer getNomID() {
        return nomID;
    }

    public void setNomID(Integer nomID) {
        this.nomID = nomID;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Sortie> getSorties() {
        return sorties;
    }

    public void setSorties(List<Sortie> sorties) {
        this.sorties = sorties;
    }


}
