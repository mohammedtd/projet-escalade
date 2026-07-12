<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mes sorties — Club Escalade</title>
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
          <span>Mes sorties</span>
        </div>
        <h1 class="page-title">Mes sorties</h1>
      </div>
      <a href="<c:url value='/choix/creer'/>" class="btn btn-primary">+ Nouvelle sortie</a>
    </div>

    <!-- Sorties créées -->
    <div class="section-title anim anim-d1" style="margin-bottom:1rem;">Sorties que j'organise</div>

    <c:if test="${empty sortiesCreees}">
      <div class="empty anim anim-d1" style="padding:40px 20px;background:var(--surface);border:1px solid var(--border);border-radius:var(--r-xl);margin-bottom:2rem;">
        <div class="empty-icon">🗓️</div>
        <div class="empty-text">Vous n'avez pas encore créé de sortie.</div>
        <a href="<c:url value='/choix/creer'/>" class="btn btn-primary" style="margin-top:16px;">Créer ma première sortie</a>
      </div>
    </c:if>

    <div style="display:flex;flex-direction:column;gap:10px;margin-bottom:2.5rem;">
      <c:forEach var="sortie" items="${sortiesCreees}" varStatus="st">
        <div class="trip-manage anim" style="animation-delay:${st.index * 0.04}s">
          <div class="trip-manage-info">
            <div class="trip-manage-name"><c:out value="${sortie.nomSortie}"/></div>
            <div class="trip-manage-detail">
              📅 <c:out value="${sortie.dateSortie}"/> &nbsp;·&nbsp;
              🏔️ <c:out value="${sortie.categorie.categorieName}"/>
            </div>
          </div>
          <div class="trip-manage-actions">
            <a href="<c:url value='/choix/modifier/${sortie.sortieID}'/>" class="btn btn-ghost btn-sm">✏️ Modifier</a>
            <form action="<c:url value='/choix/supprimer/${sortie.sortieID}'/>" method="post">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
              <button type="submit" class="btn btn-danger btn-sm">🗑️ Supprimer</button>
            </form>
          </div>
        </div>
      </c:forEach>
    </div>

    <!-- Sorties rejointes -->
    <div class="section-title anim" style="margin-bottom:1rem;">Sorties auxquelles je participe</div>

    <c:if test="${empty sortiesRejointes}">
      <div class="empty anim" style="padding:40px 20px;background:var(--surface);border:1px solid var(--border);border-radius:var(--r-xl);">
        <div class="empty-icon">👥</div>
        <div class="empty-text">Vous n'avez rejoint aucune sortie.</div>
        <a href="<c:url value='/sorties'/>" class="btn btn-ghost" style="margin-top:16px;">Explorer les sorties</a>
      </div>
    </c:if>

    <div style="display:flex;flex-direction:column;gap:10px;">
      <c:forEach var="sortie" items="${sortiesRejointes}" varStatus="st">
        <div class="trip-manage anim" style="animation-delay:${st.index * 0.04}s;border-color:rgba(16,185,129,0.2);">
          <div class="trip-manage-info">
            <div style="margin-bottom:6px;"><span class="badge badge-green">✅ Participant</span></div>
            <div class="trip-manage-name"><c:out value="${sortie.nomSortie}"/></div>
            <div class="trip-manage-detail">
              📅 <c:out value="${sortie.dateSortie}"/> &nbsp;·&nbsp;
              🏔️ <c:out value="${sortie.categorie.categorieName}"/> &nbsp;·&nbsp;
              👤 <c:out value="${sortie.createur.prenom}"/> <c:out value="${sortie.createur.nom}"/>
            </div>
          </div>
          <div class="trip-manage-actions">
            <a href="<c:url value='/sorties/${sortie.sortieID}'/>" class="btn btn-ghost btn-sm">👁️ Voir</a>
          </div>
        </div>
      </c:forEach>
    </div>

  </div>
</body>
</html>