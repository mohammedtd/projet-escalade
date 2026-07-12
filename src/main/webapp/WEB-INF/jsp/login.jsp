<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion — Club Escalade</title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <div class="auth-wrap">
    <div class="auth-card">

      <div class="auth-logo">
        <div class="auth-logo-icon">🧗</div>
        <span class="auth-logo-name">Club Escalade</span>
      </div>

      <h1 class="auth-title">Bon retour !</h1>
      <p class="auth-sub">Connectez-vous pour accéder à votre espace.</p>

      <c:if test="${param.error != null}">
        <div class="alert alert-error" style="margin-bottom:16px;">
          ⚠️ Email ou mot de passe invalide.
        </div>
      </c:if>

      <form method="post" action="<c:url value='/login'/>" class="form-stack">
        <div class="form-group">
          <label class="form-label" for="username">Email</label>
          <input id="username" class="form-input" type="email" name="username" placeholder="votre@email.com" required autofocus>
        </div>

        <div class="form-group">
          <label class="form-label" for="password">Mot de passe</label>
          <input id="password" class="form-input" type="password" name="password" placeholder="••••••••" required>
        </div>

        <a href="<c:url value='/forgot-password'/>" class="forgot-link">Mot de passe oublié ?</a>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <button type="submit" class="btn btn-primary btn-block" style="margin-top:4px;">
          Se connecter →
        </button>
      </form>

      <div class="divider"></div>
      <div style="text-align:center;">
        <a href="<c:url value='/'/>" class="btn btn-ghost btn-sm">← Retour à l'accueil</a>
      </div>

    </div>
  </div>

  <c:if test="${param.resetSuccess != null}">
    <div id="resetSuccessPopup" class="modal-overlay">
      <div class="modal-card">
        <div class="modal-icon modal-icon-success">✅</div>
        <h2 class="modal-title">Mot de passe modifié</h2>
        <p class="modal-text">Votre mot de passe a été changé avec succès. Vous pouvez maintenant vous connecter.</p>
        <button class="btn btn-success btn-block" onclick="document.getElementById('resetSuccessPopup').style.display='none'">
          Fermer
        </button>
      </div>
    </div>
  </c:if>

</body>
</html>
