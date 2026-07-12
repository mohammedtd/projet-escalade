<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nouveau mot de passe — Club Escalade</title>
  <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>

  <div class="auth-wrap">
    <div class="auth-card">

      <div class="auth-logo">
        <div class="auth-logo-icon">🔒</div>
        <span class="auth-logo-name">Club Escalade</span>
      </div>

      <h1 class="auth-title">Nouveau mot de passe</h1>
      <p class="auth-sub">Choisissez un nouveau mot de passe sécurisé pour votre compte.</p>

      <form action="<c:url value='/reset-password'/>" method="post" class="form-stack">
        <input type="hidden" name="token" value="${token}">

        <div class="form-group">
          <label class="form-label" for="nouveauMotDePasse">Nouveau mot de passe</label>
          <input id="nouveauMotDePasse" class="form-input" type="password" name="nouveauMotDePasse"
                 placeholder="Minimum 8 caractères" required autofocus>
        </div>

        <button type="submit" class="btn btn-primary btn-block">🔑 Changer le mot de passe</button>
      </form>

      <div class="divider"></div>
      <div style="text-align:center;">
        <a href="<c:url value='/login'/>" class="btn btn-ghost btn-sm">← Retour à la connexion</a>
      </div>

    </div>
  </div>

</body>
</html>
