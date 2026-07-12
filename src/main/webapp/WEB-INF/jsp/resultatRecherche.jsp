<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Résultats de recherche — Club Escalade</title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <nav class="navbar">
    <a class="nav-brand" href="<c:url value='/home'/>">
      <div class="nav-brand-icon">🧗</div>
      Club Escalade
    </a>
    <div class="nav-links">
      <a class="nav-link" href="<c:url value='/home'/>">← Retour</a>
    </div>
  </nav>

  <div class="page">

    <div class="page-header anim">
      <div>
        <div class="breadcrumb" style="margin-bottom:8px;">
          <a href="<c:url value='/home'/>">Accueil</a>
          <span class="breadcrumb-sep">›</span>
          <span>Résultats</span>
        </div>
        <h1 class="page-title">Résultats de recherche</h1>
      </div>
      <c:if test="${not empty sorties}">
        <div class="badge">🔍 ${sorties.size()} résultat<c:if test="${sorties.size() > 1}">s</c:if></div>
      </c:if>
    </div>

    <c:if test="${empty sorties}">
      <div class="empty anim">
        <div class="empty-icon">🔍</div>
        <div class="empty-text">Aucune sortie ne correspond à vos critères de recherche.</div>
        <a href="<c:url value='/home'/>" class="btn btn-ghost" style="margin-top:16px;">Modifier la recherche</a>
      </div>
    </c:if>

    <div style="display:flex;flex-direction:column;gap:10px;">
      <c:forEach var="sortie" items="${sorties}" varStatus="st">
        <div class="trip-manage anim" style="animation-delay:${st.index * 0.04}s">
          <div class="trip-manage-info">
            <div class="trip-manage-name">
              <a href="<c:url value='/sorties/${sortie.sortieID}'/>" style="color:var(--text);">
                <c:out value="${sortie.nomSortie}"/>
              </a>
            </div>
            <div class="trip-manage-detail">
              📅 <c:out value="${sortie.dateSortie}"/> &nbsp;·&nbsp;
              🏔️ <c:out value="${sortie.categorie.categorieName}"/>
              <sec:authorize access="isAuthenticated()">
                &nbsp;·&nbsp; 👤 <c:out value="${sortie.createur.prenom}"/> <c:out value="${sortie.createur.nom}"/>
              </sec:authorize>
            </div>
          </div>
          <div class="trip-manage-actions">
            <a href="<c:url value='/sorties/${sortie.sortieID}'/>" class="btn btn-ghost btn-sm">Voir →</a>
          </div>
        </div>
      </c:forEach>
    </div>

  </div>
</body>
</html>
