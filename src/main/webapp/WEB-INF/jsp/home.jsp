<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue des Sorties — Club d'Escalade</title>
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

    <!-- Top & Side Glow Ornaments -->
    <div class="absolute top-0 left-1/3 -z-10 h-[300px] w-[50%] rounded-full bg-emerald-500/5 blur-[120px]"></div>
    <div class="absolute top-1/2 right-10 -z-10 h-[250px] w-[30%] rounded-full bg-indigo-500/5 blur-[100px]"></div>

    <main class="mx-auto max-w-6xl px-4 py-8 md:px-6 md:py-12">
        
        <!-- Header -->
        <header class="mb-8 rounded-3xl border border-slate-800 bg-slate-900/40 p-6 md:p-8 backdrop-blur-xl shadow-2xl relative overflow-hidden">
            <div class="flex flex-col gap-5 md:flex-row md:items-center md:justify-between relative z-10">
                <div>
                    <h1 class="text-2xl font-extrabold text-white md:text-4xl">Catalogue des Sorties</h1>
                    <p class="mt-2 text-slate-400 text-sm md:text-base">Explore, filtre et planifie les sorties du club d'escalade.</p>
                </div>

                <sec:authorize access="!isAuthenticated()">
                    <a href="<c:url value='/login' />" class="inline-flex items-center justify-center gap-2 rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-600 px-6 py-3.5 font-bold text-white transition-all duration-300 hover:from-emerald-400 hover:to-teal-500 hover:scale-[1.02] active:scale-[0.98] shadow-lg shadow-emerald-950/40">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-5 h-5">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-7.5a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 6 21h7.5a2.25 2.25 0 0 0 2.25-2.25V15m-3 0l3-3m0 0l-3-3m3 3H9" />
                        </svg>
                        Se connecter
                    </a>
                </sec:authorize>
            </div>
        </header>

        <!-- Navigation Section -->
        <section class="mb-8 rounded-3xl border border-slate-800 bg-slate-900/40 p-6 md:p-8 backdrop-blur-xl shadow-2xl">
            <h2 class="mb-5 text-lg font-bold uppercase tracking-wider text-slate-400">Navigation</h2>
            
            <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                <a href="<c:url value='/categories' />" class="group flex items-center justify-between rounded-2xl border border-slate-800 bg-slate-950/40 p-5 transition-all duration-300 hover:border-emerald-500/30 hover:bg-slate-900/60 hover:-translate-y-0.5">
                    <span class="font-bold text-white group-hover:text-emerald-400 transition-colors">Découvrir les catégories</span>
                    <span class="text-slate-500 group-hover:text-emerald-400 transition-all group-hover:translate-x-1">→</span>
                </a>
                
                <a href="<c:url value='/sorties' />" class="group flex items-center justify-between rounded-2xl border border-slate-800 bg-slate-950/40 p-5 transition-all duration-300 hover:border-emerald-500/30 hover:bg-slate-900/60 hover:-translate-y-0.5">
                    <span class="font-bold text-white group-hover:text-emerald-400 transition-colors">Toutes les sorties</span>
                    <span class="text-slate-500 group-hover:text-emerald-400 transition-all group-hover:translate-x-1">→</span>
                </a>

                <sec:authorize access="isAuthenticated()">
                    <a href="<c:url value='/createur' />" class="group flex items-center justify-between rounded-2xl border border-slate-800 bg-slate-950/40 p-5 transition-all duration-300 hover:border-emerald-500/30 hover:bg-slate-900/60 hover:-translate-y-0.5">
                        <span class="font-bold text-white group-hover:text-emerald-400 transition-colors">Créateurs & Sorties</span>
                        <span class="text-slate-500 group-hover:text-emerald-400 transition-all group-hover:translate-x-1">→</span>
                    </a>
                    
                    <a href="<c:url value='/choix' />" class="group flex items-center justify-between rounded-2xl border border-slate-800 bg-slate-950/40 p-5 transition-all duration-300 hover:border-emerald-500/30 hover:bg-slate-900/60 hover:-translate-y-0.5">
                        <span class="font-bold text-white group-hover:text-emerald-400 transition-colors">Gérer mes sorties</span>
                        <span class="text-slate-500 group-hover:text-emerald-400 transition-all group-hover:translate-x-1">→</span>
                    </a>
                    
                    <form action="<c:url value='/logout' />" method="post" class="sm:col-span-2 lg:col-span-1">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="w-full flex items-center justify-center gap-2 rounded-2xl border border-red-500/20 bg-red-500/10 p-5 font-bold text-red-400 transition-all duration-300 hover:bg-red-500/20 hover:text-red-300">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-5 h-5">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-7.5a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 6 21h7.5a2.25 2.25 0 0 0 2.25-2.25V15m-3 0L12 12m0 0l-3-3m3 3H9" />
                            </svg>
                            Se déconnecter
                        </button>
                    </form>
                </sec:authorize>
            </div>
        </section>

        <!-- Search Form Section -->
        <section class="rounded-3xl border border-slate-800 bg-slate-900/40 p-6 md:p-8 backdrop-blur-xl shadow-2xl">
            <h2 class="mb-6 text-lg font-bold uppercase tracking-wider text-slate-400">Rechercher une sortie</h2>

            <form action="<c:url value='/sorties/search' />" method="get" class="grid gap-5 md:grid-cols-2">
                <div>
                    <label for="nom" class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">Nom de la sortie</label>
                    <input
                        type="text"
                        id="nom"
                        name="nom"
                        placeholder="Ex: Calanques, Aventure, initiation..."
                        class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white placeholder-slate-600 focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all">
                </div>

                <div>
                    <label for="categorieId" class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">Discipline / Catégorie</label>
                    <select id="categorieId" name="categorieId" class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all">
                        <option value="" class="bg-slate-900">Toutes les catégories</option>
                        <c:forEach var="categorie" items="${categories}">
                            <option value="${categorie.categorieID}" class="bg-slate-900">
                                <c:out value="${categorie.categorieName}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                    <label for="dateSortie" class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">Date prévue</label>
                    <input type="date" id="dateSortie" name="dateSortie" class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all">
                </div>

                <sec:authorize access="isAuthenticated()">
                    <div>
                        <label for="createurId" class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">Créé par</label>
                        <select id="createurId" name="createurId" class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all">
                            <option value="" class="bg-slate-900">Tous les créateurs</option>
                            <c:forEach var="membre" items="${membres}">
                                <option value="${membre.membreID}" class="bg-slate-900">
                                    <c:out value="${membre.prenom}" />
                                    <c:out value=" " />
                                    <c:out value="${membre.nom}" />
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </sec:authorize>

                <div class="md:col-span-2 mt-4">
                    <button type="submit" class="w-full md:w-auto inline-flex items-center justify-center gap-2 rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-600 px-8 py-4 font-bold text-white transition-all duration-300 hover:from-emerald-400 hover:to-teal-500 hover:scale-[1.02] active:scale-[0.98] shadow-lg shadow-emerald-950/40">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-5 h-5">
                          <path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.603 10.602Z" />
                        </svg>
                        Lancer la recherche
                    </button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>
