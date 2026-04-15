package model;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.NotEmpty;


@Entity
public class Categorie {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categorieID;
    
    @NotEmpty
    private String nomCategorie;

    
    @OneToMany(mappedBy = "categorie")
    @JsonIgnore
    private List<Sortie> sorties;


    public Categorie() {
    }


    public Integer getCategorieID() {
        return categorieID;
    }


    public void setCategorieID(Integer categorieID) {
        this.categorieID = categorieID;
    }


    public String getNomCategorie() {
        return nomCategorie;
    }


    public void setNomCategorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }


    public List<Sortie> getSorties() {
        return sorties;
    }


    public void setSorties(List<Sortie> sorties) {
        this.sorties = sorties;
    }

    
    
}
