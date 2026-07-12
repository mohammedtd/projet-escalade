<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Catégories — Club Escalade</title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <nav class="navbar">
    <a class="nav-brand" href="<c:url value='/home'/>">
      <div class="nav-brand-icon">🧗</div>
      Club Escalade
    </a>
    <div class="nav-links">
      <a class="nav-link" href="<c:url value='/sorties'/>">Sorties</a>
      <a class="nav-link" href="<c:url value='/home'/>">Accueil</a>
    </div>
  </nav>

  <div class="page">

    <div class="page-header anim">
      <div>
        <div class="breadcrumb" style="margin-bottom:8px;">
          <a href="<c:url value='/home'/>">Accueil</a>
          <span class="breadcrumb-sep">›</span>
          <span>Catégories</span>
        </div>
        <h1 class="page-title">Catégories</h1>
      </div>
      <div class="badge">${categories.size()} catégories</div>
    </div>

    <c:if test="${empty categories}">
      <div class="empty anim">
        <div class="empty-icon">🏔️</div>
        <div class="empty-text">Aucune catégorie disponible pour le moment.</div>
      </div>
    </c:if>

    <div class="grid-2">
      <c:forEach var="cat" items="${categories}" varStatus="st">
        <a href="<c:url value='/categories/${cat.categorieID}'/>" class="cat-card anim" style="animation-delay:${st.index * 0.04}s">
          <div>
            <div class="cat-card-name"><c:out value="${cat.categorieName}"/></div>
            <div style="font-size:0.78rem;color:var(--text3);margin-top:3px;">Voir les sorties</div>
          </div>
          <span class="cat-card-arrow">→</span>
        </a>
      </c:forEach>
    </div>

  </div>
</body>
</html>