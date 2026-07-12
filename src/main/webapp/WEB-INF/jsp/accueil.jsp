<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Club d'Escalade — Accueil</title>
  <meta name="description" content="Gérez votre club d'escalade : sorties, catégories, membres. Interface moderne et intuitive.">
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <section class="hero">
    <div class="hero-bg"></div>
    <div class="hero-grid"></div>
    <div class="hero-mountains"></div>

    <div class="hero-badge">
      🧗 Club d'Escalade
    </div>

    <h1 class="hero-title">
      Grimpez plus haut,<br>
      <span class="grad">ensemble.</span>
    </h1>

    <p class="hero-sub">
      Organisez vos sorties, explorez les catégories et connectez-vous avec votre club. Simple, rapide, moderne.
    </p>

    <div class="hero-actions">
      <a href="<c:url value='/login'/>" class="btn btn-primary btn-lg">
        Se connecter →
      </a>
      <a href="<c:url value='/home'/>" class="btn btn-ghost btn-lg">
        Explorer le club
      </a>
    </div>

    <div class="hero-stats">
      <div class="hero-stat">
        <div class="hero-stat-val">⛰️</div>
        <div class="hero-stat-lbl">Sorties</div>
      </div>
      <div class="hero-stat">
        <div class="hero-stat-val">🏔️</div>
        <div class="hero-stat-lbl">Catégories</div>
      </div>
      <div class="hero-stat">
        <div class="hero-stat-val">🧗</div>
        <div class="hero-stat-lbl">Membres</div>
      </div>
    </div>
  </section>

</body>
</html>