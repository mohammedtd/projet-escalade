<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><c:out value="${sortie.nomSortie}"/> — Détail</title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <nav class="navbar">
    <a class="nav-brand" href="<c:url value='/home'/>">
      <div class="nav-brand-icon">🧗</div>
      Club Escalade
    </a>
    <div class="nav-links">
      <a class="nav-link" href="<c:url value='/sorties'/>">← Sorties</a>
      <a class="nav-link" href="<c:url value='/home'/>">Accueil</a>
    </div>
  </nav>

  <div class="page page-sm">

    <div class="page-header anim">
      <div>
        <div class="breadcrumb" style="margin-bottom:8px;">
          <a href="<c:url value='/home'/>">Accueil</a>
          <span class="breadcrumb-sep">›</span>
          <a href="<c:url value='/sorties'/>">Sorties</a>
          <span class="breadcrumb-sep">›</span>
          <span>Détail</span>
        </div>
        <span class="badge">⛰️ Détail de la sortie</span>
      </div>
    </div>

    <div class="card anim" style="margin-bottom:1.5rem;">
      <h1 class="page-title" style="margin-bottom:20px;"><c:out value="${sortie.nomSortie}"/></h1>

      <div class="detail-fields">
        <div class="detail-field">
          <span class="detail-label">Description</span>
          <span class="detail-value"><c:out value="${sortie.description}"/></span>
        </div>
        <div class="detail-field">
          <span class="detail-label">Date</span>
          <span class="detail-value">📅 <c:out value="${sortie.dateSortie}"/></span>
        </div>
        <div class="detail-field">
          <span class="detail-label">Catégorie</span>
          <span class="detail-value">
            <a href="<c:url value='/categories/${sortie.categorie.categorieID}'/>" class="badge badge-blue" style="font-size:0.8rem;">
              🏔️ <c:out value="${sortie.categorie.categorieName}"/>
            </a>
          </span>
        </div>

        <sec:authorize access="isAuthenticated()">
          <div class="detail-field">
            <span class="detail-label">Créateur</span>
            <span class="detail-value">👤 <c:out value="${sortie.createur.prenom}"/> <c:out value="${sortie.createur.nom}"/></span>
          </div>
          <div class="detail-field">
            <span class="detail-label">Site web</span>
            <span class="detail-value">
              <c:if test="${not empty sortie.siteWeb}">
                <a href="${sortie.siteWeb}" target="_blank" style="color:var(--blue);">🔗 Voir le site</a>
              </c:if>
              <c:if test="${empty sortie.siteWeb}">
                <span style="color:var(--text3);">Non disponible</span>
              </c:if>
            </span>
          </div>
        </sec:authorize>
      </div>
    </div>

    <sec:authorize access="isAuthenticated()">
      <div class="card anim anim-d1">
        <div class="section-title" style="margin-bottom:16px;">Participation</div>
        <c:if test="${estInscrit}">
          <div class="badge badge-green" style="margin-bottom:16px;">✅ Vous participez à cette sortie</div>
          <form action="<c:url value='/sorties/${sortie.sortieID}/quitter'/>" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button type="submit" class="btn btn-danger">🚪 Quitter cette sortie</button>
          </form>
        </c:if>
        <c:if test="${not estInscrit}">
          <p style="color:var(--text2);font-size:0.9rem;margin-bottom:16px;">Rejoignez cette sortie pour participer avec le club.</p>
          <form action="<c:url value='/sorties/${sortie.sortieID}/rejoindre'/>" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button type="submit" class="btn btn-success">🧗 Rejoindre cette sortie</button>
          </form>
        </c:if>
      </div>
    </sec:authorize>

    <sec:authorize access="!isAuthenticated()">
      <div class="card anim anim-d1" style="text-align:center;">
        <p style="color:var(--text2);margin-bottom:16px;">Connectez-vous pour rejoindre cette sortie.</p>
        <a href="<c:url value='/login'/>" class="btn btn-primary">Se connecter</a>
      </div>
    </sec:authorize>

  </div>
</body>
</html>