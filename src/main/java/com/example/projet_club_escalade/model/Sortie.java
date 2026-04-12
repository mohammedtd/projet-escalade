package com.example.projet_club_escalade.model;

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

    private String Lieu;


    // Relation avec Categorie
    @ManyToOne
    @JoinColumn(name = "categorie_id")
    private Categorie categorie;

    @ManyToMany
    @JoinTable(name = "sortie_membres")
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
        return Lieu;
    }

    public void setLieu(String lieu) {
        Lieu = lieu;
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
    


}
