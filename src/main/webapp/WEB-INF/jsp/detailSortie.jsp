<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails de la Sortie — Club d'Escalade</title>
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
<body class="min-h-screen bg-[#090d16] bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-slate-900 via-[#090d16] to-[#04060b] text-slate-200 antialiased relative pb-16">

    <!-- Ornaments -->
    <div class="absolute top-0 left-1/4 -z-10 h-[300px] w-[50%] rounded-full bg-emerald-500/5 blur-[120px]"></div>

    <main class="mx-auto max-w-3xl px-4 py-8 md:px-6 md:py-12">
        
        <!-- Header -->
        <header class="mb-6 rounded-3xl border border-slate-800 bg-slate-900/40 p-6 backdrop-blur-xl shadow-2xl relative">
            <h1 class="text-2xl font-extrabold text-white md:text-3xl leading-tight">
                <c:out value="${sortie.nomSortie}" />
            </h1>
            <div class="mt-4 flex flex-wrap gap-2.5">
                <a href="<c:url value='/sorties' />" class="inline-flex items-center justify-center gap-1.5 rounded-2xl border border-slate-800 bg-slate-950/40 px-4 py-2 text-xs font-bold text-slate-300 hover:bg-slate-900 hover:text-white hover:border-slate-700 transition duration-300">
                    ← Sorties
                </a>
                <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-1.5 rounded-2xl border border-slate-800 bg-slate-950/40 px-4 py-2 text-xs font-bold text-slate-300 hover:bg-slate-900 hover:text-white hover:border-slate-700 transition duration-300">
                    ⌂ Accueil
                </a>
            </div>
        </header>

        <!-- Details Card -->
        <section class="rounded-3xl border border-slate-800 bg-slate-900/40 p-6 md:p-8 backdrop-blur-xl shadow-2xl space-y-6">
            
            <!-- Description -->
            <div class="border-b border-slate-800 pb-5">
                <h2 class="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">Description de l'aventure</h2>
                <p class="text-slate-300 leading-relaxed text-sm md:text-base">
                    <c:out value="${sortie.description}" />
                </p>
            </div>

            <!-- Meta Information Grid -->
            <div class="grid gap-6 sm:grid-cols-2">
                
                <div>
                    <h3 class="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-1.5">Date Prévue</h3>
                    <div class="flex items-center gap-2 text-white">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4 text-emerald-400">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" />
                        </svg>
                        <span class="text-sm font-bold"><c:out value="${sortie.dateSortie}" /></span>
                    </div>
                </div>

                <div>
                    <h3 class="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-1.5">Discipline / Catégorie</h3>
                    <div class="flex items-center gap-2">
                        <span class="h-1.5 w-1.5 rounded-full bg-emerald-400 shadow-[0_0_8px_rgba(52,211,153,0.6)]"></span>
                        <span class="text-sm font-bold text-white"><c:out value="${sortie.categorie.categorieName}" /></span>
                    </div>
                </div>

                <sec:authorize access="isAuthenticated()">
                    <div>
                        <h3 class="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-1.5">Organisé par</h3>
                        <div class="flex items-center gap-2 text-white">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4 text-emerald-400">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                            </svg>
                            <span class="text-sm font-bold">
                                <c:out value="${sortie.createur.prenom}" /> <c:out value="${sortie.createur.nom}" />
                            </span>
                        </div>
                    </div>

                    <div>
                        <h3 class="text-xs font-semibold uppercase tracking-wider text-slate-400 mb-1.5">Site Web Associé</h3>
                        <div class="flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4 text-emerald-400">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M12 21a9.004 9.004 0 0 0 8.716-6.747M12 21a9.004 9.004 0 0 1-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9s2.015-9 4.5-9m0 18c-5.982 0-10.82-4.13-11.663-9.75m11.663 9.75c5.982 0 10.82-4.13 11.663-9.75m-11.663 0A9.016 9.016 0 0 1 12 3M2.337 11.25h19.326" />
                            </svg>
                            <c:if test="${not empty sortie.siteWeb}">
                                <a href="${sortie.siteWeb}" target="_blank" class="text-sm font-bold text-emerald-400 hover:text-emerald-300 underline transition duration-300">Visiter le site</a>
                            </c:if>
                            <c:if test="${empty sortie.siteWeb}">
                                <span class="text-sm font-bold text-slate-500">Non disponible</span>
                            </c:if>
                        </div>
                    </div>
                </sec:authorize>
            </div>

            <!-- Join / Leave Buttons (Authenticated only) -->
            <sec:authorize access="isAuthenticated()">
                <div class="mt-6 border-t border-slate-800 pt-6">
                    <c:if test="${estInscrit}">
                        <form action="<c:url value='/sorties/${sortie.sortieID}/quitter' />" method="post" class="w-full sm:w-auto">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-2xl bg-red-500/10 border border-red-500/20 px-6 py-3 font-bold text-red-400 hover:bg-red-500/20 transition-all duration-300">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-5 h-5">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 12H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                </svg>
                                Se désinscrire
                            </button>
                        </form>
                    </c:if>

                    <c:if test="${not estInscrit}">
                        <form action="<c:url value='/sorties/${sortie.sortieID}/rejoindre' />" method="post" class="w-full sm:w-auto">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-600 px-6 py-3.5 font-bold text-white hover:from-emerald-400 hover:to-teal-500 transition-all duration-300 shadow-lg shadow-emerald-950/40">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-5 h-5">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                </svg>
                                Rejoindre l'aventure
                            </button>
                        </form>
                    </c:if>
                </div>
            </sec:authorize>

            <!-- Unauthenticated placeholder callout -->
            <sec:authorize access="!isAuthenticated()">
                <div class="mt-6 border-t border-slate-800 pt-6 text-center">
                    <p class="text-xs text-slate-500">
                        <a href="<c:url value='/login' />" class="font-bold text-emerald-400 hover:text-emerald-300 underline">Connecte-toi</a> pour voir plus de détails et participer à cette sortie.
                    </p>
                </div>
            </sec:authorize>
        </section>
    </main>
</body>
</html>