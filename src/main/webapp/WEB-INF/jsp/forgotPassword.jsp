<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mot de passe oublié — Club d'Escalade</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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
<body class="min-h-screen bg-[#090d16] bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-slate-900 via-[#090d16] to-[#04060b] text-slate-200 antialiased flex items-center justify-center p-4 relative overflow-hidden">

    <!-- Top Glow Ornaments -->
    <div class="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 -z-10 h-[300px] w-[300px] rounded-full bg-emerald-500/10 blur-[100px]"></div>

    <main class="w-full max-w-md rounded-3xl border border-slate-800 bg-slate-900/40 p-8 backdrop-blur-xl shadow-2xl relative">
        <section class="w-full">
            <div class="mb-6">
                <a href="<c:url value='/login' />" class="inline-flex items-center gap-2 text-xs font-semibold text-emerald-400 uppercase tracking-widest hover:text-emerald-300 transition-colors mb-2">
                    ← Retour à la connexion
                </a>
                <h1 class="text-3xl font-extrabold text-white">Mot de passe oublié</h1>
                <p class="text-sm text-slate-400 mt-2">Saisis ton email pour recevoir un lien de réinitialisation.</p>
            </div>

            <form action="<c:url value='/forgot-password' />" method="post" class="space-y-5">
                <div>
                    <label for="email" class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">Adresse Email</label>
                    <input id="email" type="email" name="email" required placeholder="nom@exemple.com" class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3.5 text-white placeholder-slate-600 focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all" />
                </div>
                <button type="submit" class="w-full rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-600 py-3.5 font-bold text-white transition-all duration-300 hover:from-emerald-400 hover:to-teal-500 hover:scale-[1.01] active:scale-[0.99] shadow-lg shadow-emerald-950/40">
                    Envoyer le lien
                </button>
            </form>
        </section>
    </main>

    <c:if test="${not empty message}">
        <div id="confirmationPopup" class="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/80 px-4 backdrop-blur-sm">
            <div class="w-full max-w-md rounded-3xl border border-slate-800 bg-slate-900 p-8 shadow-2xl text-center">
                <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 mb-4 animate-bounce">
                    <svg class="h-8 w-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 7 13.03 12.7a2 2 0 0 1-2.06 0L2 7"/>
                        <rect x="2" y="5" width="20" height="14" rx="2"/>
                    </svg>
                </div>
                <h2 class="text-2xl font-extrabold text-white">Email envoyé</h2>
                <p class="mt-2 text-slate-400 text-sm">
                    <c:out value="${message}" />
                </p>
                <div class="mt-6 flex justify-center">
                    <button
                        type="button"
                        onclick="document.getElementById('confirmationPopup').classList.add('hidden')"
                        class="rounded-2xl bg-slate-800 hover:bg-slate-700 px-6 py-2.5 font-semibold text-white transition">
                        Fermer
                    </button>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty erreur}">
        <div id="errorPopup" class="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/80 px-4 backdrop-blur-sm">
            <div class="w-full max-w-md rounded-3xl border border-slate-800 bg-slate-900 p-8 shadow-2xl text-center">
                <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-red-500/10 border border-red-500/20 text-red-400 mb-4">
                    <svg class="h-8 w-8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="9"/>
                        <path d="M12 8v5"/>
                        <path d="M12 16h.01"/>
                    </svg>
                </div>
                <h2 class="text-2xl font-extrabold text-red-400">Erreur</h2>
                <p class="mt-2 text-slate-400 text-sm">
                    <c:out value="${erreur}" />
                </p>
                <div class="mt-6 flex justify-center">
                    <button
                        type="button"
                        onclick="document.getElementById('errorPopup').classList.add('hidden')"
                        class="rounded-2xl bg-slate-800 hover:bg-slate-700 px-6 py-2.5 font-semibold text-white transition">
                        Fermer
                    </button>
                </div>
            </div>
        </div>
    </c:if>
</body>
</html>
