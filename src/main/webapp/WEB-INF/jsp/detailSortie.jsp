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
<body class="min-h-screen bg-zinc-950 text-zinc-100 antialiased pb-16">

    <!-- Top Border Line -->
    <div class="h-1.5 w-full bg-emerald-700"></div>

    <main class="mx-auto max-w-3xl px-6 py-12">
        
        <!-- Header -->
        <header class="mb-6 rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 shadow-md relative">
            <h1 class="text-xl font-extrabold text-white md:text-2xl leading-tight">
                <c:out value="${sortie.nomSortie}" />
            </h1>
            <div class="mt-4 flex flex-wrap gap-2">
                <a href="<c:url value='/sorties' />" class="inline-flex items-center justify-center gap-1.5 rounded-lg border border-zinc-800 bg-zinc-900/60 px-3.5 py-2 text-xs font-bold text-zinc-300 hover:bg-zinc-800 hover:text-white transition duration-150">
                    ← Sorties
                </a>
                <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-1.5 rounded-lg border border-zinc-800 bg-zinc-900/60 px-3.5 py-2 text-xs font-bold text-zinc-300 hover:bg-zinc-800 hover:text-white transition duration-150">
                    ⌂ Accueil
                </a>
            </div>
        </header>

        <!-- Details Card -->
        <section class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 md:p-8 shadow-md space-y-6">
            
            <!-- Description -->
            <div class="border-b border-zinc-800 pb-5">
                <h2 class="text-xs font-bold uppercase tracking-wider text-zinc-500 mb-2">Description / Programme</h2>
                <p class="text-zinc-300 leading-relaxed text-sm">
                    <c:out value="${sortie.description}" />
                </p>
            </div>

            <!-- Meta Information Grid -->
            <div class="grid gap-5 sm:grid-cols-2">
                
                <div class="flex items-start gap-3">
                    <div class="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-zinc-950 border border-zinc-800 text-emerald-400">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" />
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-[10px] font-bold uppercase tracking-wider text-zinc-500">Date</h3>
                        <span class="text-sm font-bold text-white"><c:out value="${sortie.dateSortie}" /></span>
                    </div>
                </div>

                <div class="flex items-start gap-3">
                    <div class="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-zinc-950 border border-zinc-800 text-emerald-400">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M9.568 3H5.25A2.25 2.25 0 0 0 3 5.25v4.318c0 .597.237 1.17.659 1.591l9.581 9.581a2.25 2.25 0 0 0 3.181 0l4.318-4.319a2.25 2.25 0 0 0 0-3.181l-9.58-9.581A2.25 2.25 0 0 0 9.568 3Z" />
                          <path stroke-linecap="round" stroke-linejoin="round" d="M6 6h.008v.008H6V6Z" />
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-[10px] font-bold uppercase tracking-wider text-zinc-500">Discipline / Catégorie</h3>
                        <span class="text-sm font-bold text-white"><c:out value="${sortie.categorie.categorieName}" /></span>
                    </div>
                </div>

                <sec:authorize access="isAuthenticated()">
                    <div class="flex items-start gap-3">
                        <div class="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-zinc-950 border border-zinc-800 text-emerald-400">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-[10px] font-bold uppercase tracking-wider text-zinc-500">Créateur</h3>
                            <span class="text-sm font-bold text-white">
                                <c:out value="${sortie.createur.prenom}" /> <c:out value="${sortie.createur.nom}" />
                            </span>
                        </div>
                    </div>

                    <div class="flex items-start gap-3">
                        <div class="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-zinc-950 border border-zinc-800 text-emerald-400">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M12 21a9.004 9.004 0 0 0 8.716-6.747M12 21a9.004 9.004 0 0 1-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9s2.015-9 4.5-9m0 18c-5.982 0-10.82-4.13-11.663-9.75m11.663 9.75c5.982 0 10.82-4.13 11.663-9.75m-11.663 0A9.016 9.016 0 0 1 12 3M2.337 11.25h19.326" />
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-[10px] font-bold uppercase tracking-wider text-zinc-500">Site Web</h3>
                            <c:if test="${not empty sortie.siteWeb}">
                                <a href="${sortie.siteWeb}" target="_blank" class="text-sm font-bold text-emerald-500 hover:text-emerald-400 underline transition duration-150">Visiter</a>
                            </c:if>
                            <c:if test="${empty sortie.siteWeb}">
                                <span class="text-sm font-bold text-zinc-650">Non renseigné</span>
                            </c:if>
                        </div>
                    </div>
                </sec:authorize>
            </div>

            <!-- Join / Leave Buttons (Authenticated only) -->
            <sec:authorize access="isAuthenticated()">
                <div class="mt-6 border-t border-zinc-800 pt-6">
                    <c:if test="${estInscrit}">
                        <form action="<c:url value='/sorties/${sortie.sortieID}/quitter' />" method="post" class="w-full sm:w-auto">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-lg border border-red-950 bg-red-950/20 px-5 py-3 text-xs font-bold text-red-400 hover:bg-red-950/30 transition-all duration-150">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 12H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                </svg>
                                Se désinscrire de cette sortie
                            </button>
                        </form>
                    </c:if>

                    <c:if test="${not estInscrit}">
                        <form action="<c:url value='/sorties/${sortie.sortieID}/rejoindre' />" method="post" class="w-full sm:w-auto">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-lg bg-emerald-700 hover:bg-emerald-600 px-5 py-3 text-xs font-bold text-white transition-all duration-150 shadow-sm">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                </svg>
                                S'inscrire à cette sortie
                            </button>
                        </form>
                    </c:if>
                </div>
            </sec:authorize>

            <!-- Unauthenticated placeholder callout -->
            <sec:authorize access="!isAuthenticated()">
                <div class="mt-6 border-t border-zinc-800 pt-6 text-center">
                    <p class="text-xs text-zinc-500">
                        Veuillez vous <a href="<c:url value='/login' />" class="font-bold text-emerald-500 hover:underline">connecter</a> pour obtenir les détails de l'organisateur et vous inscrire.
                    </p>
                </div>
            </sec:authorize>
        </section>
    </main>
</body>
</html>