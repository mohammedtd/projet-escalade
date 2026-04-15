package model;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotEmpty;

@Entity
public class Sortie {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sortieID;
    
    @NotEmpty
    private String nomSortie;
    
    private LocalDate dateSortie;

    private String description;

    private String siteWeb;

    private String lieu;
    


    @ManyToOne
    @JoinColumn(name = "categorie_id")
    private Categorie categorie;

    @ManyToOne
    @JoinColumn(name = "membre_createur_id")
    private Membre membreCreateur;

    @ManyToMany
    @JoinTable(
        name = "sortie_membres",
        joinColumns = @JoinColumn(name = "sortie_id"),
        inverseJoinColumns = @JoinColumn(name = "membre_id")
    )
    private List<Membre> membres;

    public Sortie() {
    }

    public Integer getSortieID() {
        return sortieID;
    }

    public void setSortieID(Integer sortieID) {
        this.sortieID = sortieID;
    }

    public String getNomSortie() {
        return nomSortie;
    }

    public void setNomSortie(String nomSortie) {
        this.nomSortie = nomSortie;
    }

    public LocalDate getDateSortie() {
        return dateSortie;
    }

    public void setDateSortie(LocalDate dateSortie) {
        this.dateSortie = dateSortie;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public List<Membre> getMembres() {
        return membres;
    }

    public void setMembres(List<Membre> membres) {
        this.membres = membres;
    }
    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSiteWeb() {
        return siteWeb;
    }

    public void setSiteWeb(String siteWeb) {
        this.siteWeb = siteWeb;
    }

    public Membre getMembreCreateur() {
        return membreCreateur;
    }

    public void setMembreCreateur(Membre membreCreateur) {
        this.membreCreateur = membreCreateur;
    }
}
