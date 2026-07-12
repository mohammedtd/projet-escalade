<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <title>Réinitialiser le mot de passe</title>
            <script src="https://cdn.tailwindcss.com"></script>
        </head>

        <body class="min-h-screen bg-slate-100 text-slate-800">
            <main class="mx-auto flex min-h-screen max-w-2xl items-center px-4 py-10">
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mot de passe oublié — Club d'Escalade</title>
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
        <section class="w-full">
            <div class="mb-6">
                <a href="<c:url value='/login' />" class="inline-flex items-center gap-1.5 text-xs font-bold text-emerald-500 uppercase tracking-wider hover:text-emerald-400 transition-colors mb-3">
                    ← Connexion
                </a>
                <h1 class="text-2xl font-extrabold text-white tracking-tight">Mot de passe oublié</h1>
                <p class="text-xs text-zinc-400 mt-1">Saisissez votre email pour recevoir le lien de récupération.</p>
            </div>

            <form action="<c:url value='/forgot-password' />" method="post" class="space-y-4">
                <div>
                    <label for="email" class="block text-xs font-bold uppercase tracking-wider text-zinc-400 mb-1.5">Email</label>
                    <input id="email" type="email" name="email" required placeholder="nom@exemple.com" class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white placeholder-zinc-750 focus:border-emerald-700 focus:outline-none transition-all" />
                </div>
                <button type="submit" class="w-full rounded-lg bg-emerald-700 hover:bg-emerald-600 py-3 text-sm font-bold text-white transition-all duration-200 shadow-sm mt-2">
                    Recevoir le lien
                </button>
            </form>
        </section>
    </main>

    <c:if test="${not empty message}">
        <div id="confirmationPopup" class="fixed inset-0 z-50 flex items-center justify-center bg-zinc-950/80 px-4">
            <div class="w-full max-w-md rounded-xl border border-zinc-800 bg-zinc-900 p-6 shadow-xl text-center">
                <div class="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-emerald-950 border border-emerald-800 text-emerald-400 mb-4 animate-bounce">
                    <svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 7 13.03 12.7a2 2 0 0 1-2.06 0L2 7"/>
                        <rect x="2" y="5" width="20" height="14" rx="2"/>
                    </svg>
                </div>
                <h2 class="text-lg font-extrabold text-white">Email envoyé</h2>
                <p class="mt-1.5 text-zinc-400 text-xs">
                    <c:out value="${message}" />
                </p>
                <div class="mt-5 flex justify-center">
                    <button
                        type="button"
                        onclick="document.getElementById('confirmationPopup').classList.add('hidden')"
                        class="rounded-lg bg-zinc-800 hover:bg-zinc-700 px-5 py-2 text-xs font-semibold text-white transition">
                        Fermer
                    </button>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty erreur}">
        <div id="errorPopup" class="fixed inset-0 z-50 flex items-center justify-center bg-zinc-950/80 px-4">
            <div class="w-full max-w-md rounded-xl border border-zinc-800 bg-zinc-900 p-6 shadow-xl text-center">
                <div class="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-red-950 border border-red-900/40 text-red-400 mb-4">
                    <svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="9"/>
                        <path d="M12 8v5"/>
                        <path d="M12 16h.01"/>
                    </svg>
                </div>
                <h2 class="text-lg font-extrabold text-red-400">Erreur</h2>
                <p class="mt-1.5 text-zinc-400 text-xs">
                    <c:out value="${erreur}" />
                </p>
                <div class="mt-5 flex justify-center">
                    <button
                        type="button"
                        onclick="document.getElementById('errorPopup').classList.add('hidden')"
                        class="rounded-lg bg-zinc-800 hover:bg-zinc-700 px-5 py-2 text-xs font-semibold text-white transition">
                        Fermer
                    </button>
                </div>
            </div>
        </div>
    </c:if>
</body>
</html>