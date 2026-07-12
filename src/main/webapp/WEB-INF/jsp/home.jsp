<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tableau de bord — Club Escalade</title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar">
    <a class="nav-brand" href="<c:url value='/home'/>">
      <div class="nav-brand-icon">🧗</div>
      Club Escalade
    </a>
    <div class="nav-links">
      <a class="nav-link" href="<c:url value='/categories'/>">Catégories</a>
      <a class="nav-link" href="<c:url value='/sorties'/>">Sorties</a>
      <sec:authorize access="isAuthenticated()">
        <a class="nav-link" href="<c:url value='/createur'/>">Créateurs</a>
        <a class="nav-link" href="<c:url value='/choix'/>">Mes sorties</a>
        <form action="<c:url value='/logout'/>" method="post" style="display:inline">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          <button type="submit" class="nav-link" style="cursor:pointer;background:none;border:none;font-size:inherit;">Déconnexion</button>
        </form>
      </sec:authorize>
      <sec:authorize access="!isAuthenticated()">
        <a class="nav-link nav-link-btn" href="<c:url value='/login'/>">Se connecter</a>
      </sec:authorize>
    </div>
  </nav>

  <div class="page">

    <!-- Header -->
    <div class="page-header anim">
      <div>
        <div class="badge" style="margin-bottom:10px;">🏔️ Tableau de bord</div>
        <h1 class="page-title">Bienvenue au club</h1>
      </div>
    </div>

    <!-- Stats row -->
    <div class="grid-3 anim anim-d1" style="margin-bottom:1.5rem;">
      <div class="stat-card">
        <div class="stat-value">${sorties.size()}</div>
        <div class="stat-label">Sorties disponibles</div>
      </div>
      <div class="stat-card">
        <div class="stat-value">${categories.size()}</div>
        <div class="stat-label">Catégories</div>
      </div>
      <div class="stat-card">
        <div class="stat-value">${membres.size()}</div>
        <div class="stat-label">Créateurs actifs</div>
      </div>
    </div>

    <!-- Navigation tiles -->
    <div class="section-title anim anim-d2">Navigation rapide</div>
    <div class="nav-grid anim anim-d2">
      <a href="<c:url value='/categories'/>" class="nav-tile">
        <span class="nav-tile-icon">🏔️</span> Catégories
      </a>
      <a href="<c:url value='/sorties'/>" class="nav-tile">
        <span class="nav-tile-icon">⛰️</span> Toutes les sorties
      </a>
      <sec:authorize access="isAuthenticated()">
        <a href="<c:url value='/createur'/>" class="nav-tile">
          <span class="nav-tile-icon">👥</span> Créateurs &amp; sorties
        </a>
        <a href="<c:url value='/choix'/>" class="nav-tile">
          <span class="nav-tile-icon">📋</span> Gérer mes sorties
        </a>
        <form action="<c:url value='/logout'/>" method="post" style="display:contents">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          <button type="submit" class="nav-tile nav-tile-danger" style="text-align:left;cursor:pointer;">
            <span class="nav-tile-icon">🚪</span> Se déconnecter
          </button>
        </form>
      </sec:authorize>
    </div>

    <!-- Search section -->
    <div class="section-title anim anim-d3">Rechercher une sortie</div>
    <div class="search-card anim anim-d3">
      <form action="<c:url value='/sorties/search'/>" method="get" class="form-grid">
        <div class="form-group">
          <label class="form-label" for="nom">Nom de la sortie</label>
          <input id="nom" class="form-input" type="text" name="nom" placeholder="Falaise, montagne...">
        </div>

        <div class="form-group">
          <label class="form-label" for="categorieId">Catégorie</label>
          <select id="categorieId" class="form-select" name="categorieId">
            <option value="">— Toutes —</option>
            <c:forEach var="cat" items="${categories}">
              <option value="${cat.categorieID}"><c:out value="${cat.categorieName}"/></option>
            </c:forEach>
          </select>
        </div>

        <div class="form-group">
          <label class="form-label" for="dateSortie">Date</label>
          <input id="dateSortie" class="form-input" type="date" name="dateSortie">
        </div>

        <sec:authorize access="isAuthenticated()">
          <div class="form-group">
            <label class="form-label" for="createurId">Créateur</label>
            <select id="createurId" class="form-select" name="createurId">
              <option value="">— Tous —</option>
              <c:forEach var="m" items="${membres}">
                <option value="${m.membreID}"><c:out value="${m.prenom}"/> <c:out value="${m.nom}"/></option>
              </c:forEach>
            </select>
          </div>
        </sec:authorize>

        <div style="grid-column: 1 / -1;">
          <button type="submit" class="btn btn-primary">🔍 Rechercher</button>
        </div>
      </form>
    </div>

  </div>
</body>
</html>
