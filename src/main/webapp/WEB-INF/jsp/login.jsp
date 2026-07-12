<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion — Club d'Escalade</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          fontFamily: {
            sans: ['"Plus Jakarta Sans"', 'sans-serif'],
          }
        }
      }
    }
  </script>
</head>
<body class="min-h-screen bg-zinc-950 text-zinc-100 antialiased flex items-center justify-center p-4">

  <main class="w-full max-w-md rounded-xl border border-zinc-800 bg-zinc-900/30 p-8 shadow-lg">
    
    <div class="mb-6">
      <a href="<c:url value='/' />" class="inline-flex items-center gap-1.5 text-xs font-bold text-emerald-500 uppercase tracking-wider hover:text-emerald-400 transition-colors mb-3">
        ← Accueil
      </a>
      <h1 class="text-2xl font-extrabold text-white tracking-tight">Espace Membre</h1>
      <p class="text-xs text-zinc-400 mt-1">Connectez-vous pour accéder à votre espace de grimpe.</p>
    </div>

    <c:if test="${param.error != null}">
      <div class="mb-5 rounded-lg bg-red-950/20 border border-red-900/40 p-4 text-xs text-red-400 flex items-center gap-2">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4 shrink-0">
          <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
        </svg>
        <span>Identifiants invalides. Veuillez réessayer.</span>
      </div>
    </c:if>

    <form method="post" action="<c:url value='/login' />" class="space-y-4">
      <div>
        <label class="block text-xs font-bold uppercase tracking-wider text-zinc-400 mb-1.5">Email</label>
        <input name="username" type="email" placeholder="votre@email.com" class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white placeholder-zinc-700 focus:border-emerald-700 focus:outline-none transition-all" required />
      </div>
      <div>
        <div class="flex justify-between items-center mb-1.5">
          <label class="block text-xs font-bold uppercase tracking-wider text-zinc-400">Mot de passe</label>
          <a href="<c:url value='/forgot-password' />" class="text-xs font-bold text-emerald-500 hover:text-emerald-400 transition-colors">
            Oublié ?
          </a>
        </div>
        <input name="password" type="password" placeholder="••••••••" class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white placeholder-zinc-700 focus:border-emerald-700 focus:outline-none transition-all" required />
      </div>

      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

      <button type="submit" class="w-full rounded-lg bg-emerald-700 hover:bg-emerald-600 py-3 text-sm font-bold text-white transition-all duration-200 shadow-sm mt-2">
        Connexion
      </button>
    </form>
  </main>

  <c:if test="${param.resetSuccess != null}">
    <div id="resetSuccessPopup" class="fixed inset-0 z-50 flex items-center justify-center bg-zinc-950/80 px-4">
      <div class="w-full max-w-md rounded-xl border border-zinc-800 bg-zinc-900 p-6 shadow-xl text-center">
        <div class="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-emerald-950 border border-emerald-800 text-emerald-400 mb-4">
          <svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 6 9 17l-5-5"/>
          </svg>
        </div>
        <h2 class="text-lg font-extrabold text-white">Mot de passe modifié</h2>
        <p class="mt-1.5 text-zinc-400 text-xs">
          Votre mot de passe a été modifié. Vous pouvez vous connecter.
        </p>
        <div class="mt-5 flex justify-center">
          <button
            type="button"
            onclick="document.getElementById('resetSuccessPopup').classList.add('hidden')"
            class="rounded-lg bg-zinc-800 hover:bg-zinc-700 px-5 py-2 text-xs font-semibold text-white transition">
            Fermer
          </button>
        </div>
      </div>
    </div>
  </c:if>
</body>
</html>