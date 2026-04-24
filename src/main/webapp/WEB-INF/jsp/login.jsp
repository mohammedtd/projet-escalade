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

  <c:if test="${param.resetSuccess != null}">
    <div id="resetSuccessPopup" class="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/50 px-4">
      <div class="w-full max-w-md rounded-2xl bg-white p-6 shadow-2xl">
        <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-emerald-100">
          <svg class="h-8 w-8 text-emerald-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M20 6 9 17l-5-5"/>
          </svg>
        </div>
        <h2 class="mt-4 text-center text-xl font-bold text-slate-900">Mot de passe modifié</h2>
        <p class="mt-3 text-center text-slate-600">
          Votre mot de passe a été changé avec succès.
        </p>
        <div class="mt-6 flex justify-center">
          <button
            type="button"
            onclick="document.getElementById('resetSuccessPopup').classList.add('hidden')"
            class="rounded-xl bg-emerald-600 px-5 py-2 font-semibold text-white transition hover:bg-emerald-700">
            Fermer
          </button>
        </div>
      </div>
    </div>
  </c:if>
</body>
</html>
