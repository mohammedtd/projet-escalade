<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mot de passe oublié — Club Escalade</title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <div class="auth-wrap">
    <div class="auth-card">

      <div class="auth-logo">
        <div class="auth-logo-icon">🔑</div>
        <span class="auth-logo-name">Club Escalade</span>
      </div>

      <h1 class="auth-title">Mot de passe oublié</h1>
      <p class="auth-sub">Entrez votre email pour recevoir un lien de réinitialisation.</p>

      <form action="<c:url value='/forgot-password'/>" method="post" class="form-stack">
        <div class="form-group">
          <label class="form-label" for="email">Adresse email</label>
          <input id="email" class="form-input" type="email" name="email" placeholder="votre@email.com" required autofocus>
        </div>

        <button type="submit" class="btn btn-primary btn-block">📧 Envoyer le lien</button>
      </form>

      <div class="divider"></div>
      <div style="text-align:center;">
        <a href="<c:url value='/login'/>" class="btn btn-ghost btn-sm">← Retour à la connexion</a>
      </div>

    </div>
  </div>

  <c:if test="${not empty message}">
    <div id="confirmPopup" class="modal-overlay">
      <div class="modal-card">
        <div class="modal-icon modal-icon-success">📧</div>
        <h2 class="modal-title">Email envoyé !</h2>
        <p class="modal-text"><c:out value="${message}"/></p>
        <button class="btn btn-success btn-block" onclick="document.getElementById('confirmPopup').style.display='none'">
          Fermer
        </button>
      </div>
    </div>
  </c:if>

  <c:if test="${not empty erreur}">
    <div id="errorPopup" class="modal-overlay">
      <div class="modal-card">
        <div class="modal-icon modal-icon-error">⚠️</div>
        <h2 class="modal-title" style="color:var(--red);">Erreur</h2>
        <p class="modal-text"><c:out value="${erreur}"/></p>
        <button class="btn btn-danger btn-block" onclick="document.getElementById('errorPopup').style.display='none'">
          Fermer
        </button>
      </div>
    </div>
  </c:if>

</body>
</html>
