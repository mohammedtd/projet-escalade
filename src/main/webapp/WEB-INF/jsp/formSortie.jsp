<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulaire sortie — Club Escalade</title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <nav class="navbar">
    <a class="nav-brand" href="<c:url value='/home'/>">
      <div class="nav-brand-icon">🧗</div>
      Club Escalade
    </a>
    <div class="nav-links">
      <a class="nav-link" href="<c:url value='/choix'/>">← Mes sorties</a>
    </div>
  </nav>

  <div class="page page-sm">

    <div class="page-header anim">
      <div>
        <div class="breadcrumb" style="margin-bottom:8px;">
          <a href="<c:url value='/home'/>">Accueil</a>
          <span class="breadcrumb-sep">›</span>
          <a href="<c:url value='/choix'/>">Mes sorties</a>
          <span class="breadcrumb-sep">›</span>
          <span>Formulaire</span>
        </div>
        <h1 class="page-title">
          <c:if test="${empty sortie.sortieID}">Créer une sortie</c:if>
          <c:if test="${not empty sortie.sortieID}">Modifier la sortie</c:if>
        </h1>
      </div>
    </div>

    <div class="card anim">
      <form method="post" class="form-stack">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <div class="form-grid">
          <div class="form-group" style="grid-column:1/-1;">
            <label class="form-label" for="nomSortie">Nom de la sortie *</label>
            <input id="nomSortie" class="form-input" type="text" name="nomSortie"
                   value="<c:out value='${sortie.nomSortie}'/>" placeholder="Ex: Aventure Calanques..." required>
          </div>

          <div class="form-group" style="grid-column:1/-1;">
            <label class="form-label" for="description">Description *</label>
            <textarea id="description" class="form-input form-textarea" name="description"
                      placeholder="Décrivez la sortie, le niveau requis, l'équipement..."><c:out value="${sortie.description}"/></textarea>
          </div>

          <div class="form-group">
            <label class="form-label" for="dateSortie">Date *</label>
            <input id="dateSortie" class="form-input" type="date" name="dateSortie"
                   value="<c:out value='${sortie.dateSortie}'/>" required>
          </div>

          <div class="form-group">
            <label class="form-label" for="categorieId">Catégorie *</label>
            <select id="categorieId" class="form-select" name="categorieId">
              <c:forEach var="cat" items="${categories}">
                <option value="${cat.categorieID}"
                  <c:if test="${sortie.categorie != null && sortie.categorie.categorieID == cat.categorieID}">selected</c:if>>
                  <c:out value="${cat.categorieName}"/>
                </option>
              </c:forEach>
            </select>
          </div>

          <div class="form-group" style="grid-column:1/-1;">
            <label class="form-label" for="siteWeb">Site Web (optionnel)</label>
            <input id="siteWeb" class="form-input" type="url" name="siteWeb"
                   value="<c:out value='${sortie.siteWeb}'/>" placeholder="https://...">
          </div>
        </div>

        <div style="display:flex;gap:10px;margin-top:8px;">
          <button type="submit" class="btn btn-primary btn-lg">
            <c:if test="${empty sortie.sortieID}">✅ Créer la sortie</c:if>
            <c:if test="${not empty sortie.sortieID}">💾 Sauvegarder</c:if>
          </button>
          <a href="<c:url value='/choix'/>" class="btn btn-ghost btn-lg">Annuler</a>
        </div>
      </form>
    </div>

  </div>
</body>
</html>