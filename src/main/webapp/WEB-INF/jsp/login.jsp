<!-- filepath: /Users/mohammedtd/projet-escalade_toujad_benhila/src/main/webapp/WEB-INF/jsp/login.jsp -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Connexion</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800 flex items-center justify-center p-6">
  <main class="w-full max-w-md rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
    <h1 class="text-2xl font-bold text-slate-900 mb-4">Se connecter</h1>

    <c:if test="${param.error != null}">
      <p class="mb-4 rounded-lg bg-red-50 border border-red-200 p-3 text-red-700">
        Identifiants invalides.
      </p>
    </c:if>

    <form method="post" action="<c:url value='/login' />" class="space-y-4">
      <div>
        <label class="block text-sm font-medium mb-1">Email</label>
        <input name="username" type="text" class="w-full rounded-xl border border-slate-300 px-3 py-2" required />
      </div>
      <div>
        <label class="block text-sm font-medium mb-1">Mot de passe</label>
        <input name="password" type="password" class="w-full rounded-xl border border-slate-300 px-3 py-2" required />
      </div>

      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

      <button type="submit" class="w-full rounded-xl bg-blue-600 px-4 py-2 font-semibold text-white hover:bg-blue-700">
        Connexion
      </button>
      <p class="text-center text-sm text-slate-600">
            <a href="<c:url value='/forgot-password' />" class="font-medium text-blue-600 hover:underline">
            Mot de passe oublié ?
            </a>
        </p>
    </form>
  </main>
</body>
</html>