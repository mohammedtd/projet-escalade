<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Créateurs — Club Escalade</title>
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

  <sec:authorize access="isAuthenticated()">
    <div class="page">

      <div class="page-header anim">
        <div>
          <div class="breadcrumb" style="margin-bottom:8px;">
            <a href="<c:url value='/home'/>">Accueil</a>
            <span class="breadcrumb-sep">›</span>
            <span>Créateurs</span>
          </div>
          <h1 class="page-title">Créateurs &amp; leurs sorties</h1>
        </div>
        <div class="badge">👥 ${membres.size()} créateurs</div>
      </div>

      <c:if test="${empty membres}">
        <div class="empty anim">
          <div class="empty-icon">👥</div>
          <div class="empty-text">Aucun créateur disponible pour le moment.</div>
        </div>
      </c:if>

      <div class="grid-3">
        <c:forEach var="membre" items="${membres}" varStatus="st">
          <c:if test="${not empty membre.sorties}">
            <div class="member-card anim" style="animation-delay:${st.index * 0.05}s">
              <div class="avatar">${membre.prenom.charAt(0)}</div>
              <div class="member-name"><c:out value="${membre.prenom}"/> <c:out value="${membre.nom}"/></div>
              <div class="member-meta">${membre.sorties.size()} sortie<c:if test="${membre.sorties.size() > 1}">s</c:if></div>
              <ul class="trip-mini-list">
                <c:forEach var="sortie" items="${membre.sorties}" end="4">
                  <li class="trip-mini-list">
                    <a href="<c:url value='/sorties/${sortie.sortieID}'/>">
                      🧗 <c:out value="${sortie.nomSortie}"/>
                    </a>
                  </li>
                </c:forEach>
                <c:if test="${membre.sorties.size() > 5}">
                  <li style="font-size:0.78rem;color:var(--text3);padding:4px 8px;">
                    + ${membre.sorties.size() - 5} autres sorties
                  </li>
                </c:if>
              </ul>
            </div>
          </c:if>
        </c:forEach>
      </div>

    </div>
  </sec:authorize>

  <sec:authorize access="!isAuthenticated()">
    <div class="auth-wrap">
      <div class="auth-card" style="text-align:center;">
        <div style="font-size:3rem;margin-bottom:16px;">🔒</div>
        <h1 class="auth-title">Accès restreint</h1>
        <p class="auth-sub">Connectez-vous pour voir les créateurs et leurs sorties.</p>
        <a href="<c:url value='/login'/>" class="btn btn-primary btn-block">Se connecter</a>
      </div>
    </div>
  </sec:authorize>

</body>
</html>