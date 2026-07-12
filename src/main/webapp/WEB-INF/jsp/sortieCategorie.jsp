<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sorties — <c:out value="${categorie.categorieName}"/></title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <nav class="navbar">
    <a class="nav-brand" href="<c:url value='/home'/>">
      <div class="nav-brand-icon">🧗</div>
      Club Escalade
    </a>
    <div class="nav-links">
      <a class="nav-link" href="<c:url value='/categories'/>">← Catégories</a>
      <a class="nav-link" href="<c:url value='/home'/>">Accueil</a>
    </div>
  </nav>

  <div class="page">

    <div class="page-header anim">
      <div>
        <div class="breadcrumb" style="margin-bottom:8px;">
          <a href="<c:url value='/home'/>">Accueil</a>
          <span class="breadcrumb-sep">›</span>
          <a href="<c:url value='/categories'/>">Catégories</a>
          <span class="breadcrumb-sep">›</span>
          <span><c:out value="${categorie.categorieName}"/></span>
        </div>
        <h1 class="page-title"><c:out value="${categorie.categorieName}"/></h1>
      </div>
      <div class="badge">⛰️ ${sorties.size()} sortie<c:if test="${sorties.size() > 1}">s</c:if></div>
    </div>

    <c:if test="${empty sorties}">
      <div class="empty anim">
        <div class="empty-icon">🏔️</div>
        <div class="empty-text">Aucune sortie dans cette catégorie pour le moment.</div>
      </div>
    </c:if>

    <div style="display:flex;flex-direction:column;gap:8px;">
      <c:forEach var="sortie" items="${sorties}" varStatus="st">
        <a href="<c:url value='/sorties/${sortie.sortieID}'/>" class="trip-row anim" style="animation-delay:${st.index * 0.03}s">
          <div>
            <div class="trip-row-name"><c:out value="${sortie.nomSortie}"/></div>
            <div class="trip-row-meta">📅 <c:out value="${sortie.dateSortie}"/></div>
          </div>
          <span class="trip-row-arrow">→</span>
        </a>
      </c:forEach>
    </div>

  </div>
</body>
</html>