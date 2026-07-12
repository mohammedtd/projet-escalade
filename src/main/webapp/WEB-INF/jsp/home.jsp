<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
      <!DOCTYPE html>
      <html lang="fr">

      <head>
        <meta charset="UTF-8">
        <title>Accueil - Club d'escalade</title>
        <script src="https://cdn.tailwindcss.com"></script>
      </head>

      <body class="min-h-screen bg-slate-100 text-slate-800">
        <main class="mx-auto max-w-6xl px-4 py-8 md:px-6 md:py-10">
          <header class="mb-8 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <div class="flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
              <div>
                <h1 class="text-2xl font-extrabold text-slate-900 md:text-4xl">Bienvenue sur le catalogue des sorties du
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

    <main class="mx-auto max-w-6xl px-6 py-12">
        
        <!-- Header -->
        <header class="mb-8 rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 md:p-8 shadow-md">
            <div class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h1 class="text-2xl font-extrabold text-white md:text-3xl tracking-tight">Catalogue des Sorties</h1>
                    <p class="mt-1.5 text-zinc-400 text-xs md:text-sm">Planification et filtres des sorties officielles du club.</p>
                </div>

                <sec:authorize access="!isAuthenticated()">
                    <a href="<c:url value='/login' />" class="inline-flex items-center justify-center gap-2 rounded-lg bg-emerald-700 hover:bg-emerald-600 px-5 py-3 text-xs font-bold text-white transition-all duration-200 shadow-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-7.5a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 6 21h7.5a2.25 2.25 0 0 0 2.25-2.25V15m-3 0l3-3m0 0l-3-3m3 3H9" />
                        </svg>
                        Espace Membre
                    </a>
                </sec:authorize>
            </div>
        </header>

        <!-- Navigation Section -->
        <section class="mb-8 rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 shadow-md">
            <h2 class="mb-4 text-xs font-bold uppercase tracking-wider text-zinc-500">Navigation et Accès</h2>
            
            <div class="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
                <a href="<c:url value='/categories' />" class="group flex items-center justify-between rounded-lg border border-zinc-800/80 bg-zinc-900/10 p-4 transition duration-150 hover:border-emerald-700/50 hover:bg-zinc-900/50">
                    <div class="flex items-center gap-3">
                        <span class="text-zinc-500 group-hover:text-emerald-400">📂</span>
                        <span class="text-sm font-bold text-zinc-200 group-hover:text-white transition-colors">Explorer les catégories</span>
                    </div>
                    <span class="text-zinc-600 group-hover:text-emerald-400 group-hover:translate-x-0.5 transition-all text-xs">→</span>
                </a>
                
                <a href="<c:url value='/sorties' />" class="group flex items-center justify-between rounded-lg border border-zinc-800/80 bg-zinc-900/10 p-4 transition duration-150 hover:border-emerald-700/50 hover:bg-zinc-900/50">
                    <div class="flex items-center gap-3">
                        <span class="text-zinc-500 group-hover:text-emerald-400">🧗</span>
                        <span class="text-sm font-bold text-zinc-200 group-hover:text-white transition-colors">Toutes les sorties</span>
                    </div>
                    <span class="text-zinc-600 group-hover:text-emerald-400 group-hover:translate-x-0.5 transition-all text-xs">→</span>
                </a>

                <sec:authorize access="isAuthenticated()">
                    <a href="<c:url value='/createur' />" class="group flex items-center justify-between rounded-lg border border-zinc-800/80 bg-zinc-900/10 p-4 transition duration-150 hover:border-emerald-700/50 hover:bg-zinc-900/50">
                        <div class="flex items-center gap-3">
                            <span class="text-zinc-500 group-hover:text-emerald-400">👥</span>
                            <span class="text-sm font-bold text-zinc-200 group-hover:text-white transition-colors">Créateurs & Sorties</span>
                        </div>
                        <span class="text-zinc-600 group-hover:text-emerald-400 group-hover:translate-x-0.5 transition-all text-xs">→</span>
                    </a>
                    
                    <a href="<c:url value='/choix' />" class="group flex items-center justify-between rounded-lg border border-zinc-800/80 bg-zinc-900/10 p-4 transition duration-150 hover:border-emerald-700/50 hover:bg-zinc-900/50">
                        <div class="flex items-center gap-3">
                            <span class="text-zinc-500 group-hover:text-emerald-400">⚙️</span>
                            <span class="text-sm font-bold text-zinc-200 group-hover:text-white transition-colors">Gérer mes sorties</span>
                        </div>
                        <span class="text-zinc-600 group-hover:text-emerald-400 group-hover:translate-x-0.5 transition-all text-xs">→</span>
                    </a>
                    
                    <form action="<c:url value='/logout' />" method="post" class="sm:col-span-2 lg:col-span-1">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="w-full flex items-center justify-center gap-2 rounded-lg border border-red-950 bg-red-950/20 p-4 text-xs font-bold text-red-400 transition hover:bg-red-950/40 hover:text-red-300">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-7.5a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 6 21h7.5a2.25 2.25 0 0 0 2.25-2.25V15m-3 0L12 12m0 0l-3-3m3 3H9" />
                            </svg>
                            Se déconnecter
                        </button>
                    </form>
                </sec:authorize>
            </div>
        </section>

        <!-- Search Form Section -->
        <section class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 shadow-md">
            <h2 class="mb-5 text-xs font-bold uppercase tracking-wider text-zinc-500">Filtrer les activités</h2>

            <form action="<c:url value='/sorties/search' />" method="get" class="grid gap-5 md:grid-cols-2">
                <div>
                    <label for="nom" class="block text-xs font-bold text-zinc-400 mb-1.5">Nom de la sortie</label>
                    <input
                        type="text"
                        id="nom"
                        name="nom"
                        placeholder="Rechercher par mot-clé..."
                        class="w-full rounded-lg border border-zinc-850 bg-zinc-950 px-3.5 py-2.5 text-sm text-white placeholder-zinc-600 focus:border-emerald-700 focus:outline-none transition-all">
                </div>

                <div>
                    <label for="categorieId" class="block text-xs font-bold text-zinc-400 mb-1.5">Catégorie</label>
                    <select id="categorieId" name="categorieId" class="w-full rounded-lg border border-zinc-850 bg-zinc-950 px-3.5 py-2.5 text-sm text-white focus:border-emerald-700 focus:outline-none transition-all">
                        <option value="" class="bg-zinc-900">Toutes les catégories</option>
                        <c:forEach var="categorie" items="${categories}">
                            <option value="${categorie.categorieID}" class="bg-zinc-900">
                                <c:out value="${categorie.categorieName}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                    <label for="dateSortie" class="block text-xs font-bold text-zinc-400 mb-1.5">Date</label>
                    <input type="date" id="dateSortie" name="dateSortie" class="w-full rounded-lg border border-zinc-850 bg-zinc-950 px-3.5 py-2.5 text-sm text-white focus:border-emerald-700 focus:outline-none transition-all">
                </div>

                <sec:authorize access="isAuthenticated()">
                    <div>
                        <label for="createurId" class="block text-xs font-bold text-zinc-400 mb-1.5">Créateur</label>
                        <select id="createurId" name="createurId" class="w-full rounded-lg border border-zinc-850 bg-zinc-950 px-3.5 py-2.5 text-sm text-white focus:border-emerald-700 focus:outline-none transition-all">
                            <option value="" class="bg-zinc-900">Tous les créateurs</option>
                            <c:forEach var="membre" items="${membres}">
                                <option value="${membre.membreID}" class="bg-zinc-900">
                                    <c:out value="${membre.prenom}" /> <c:out value="${membre.nom}" />
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </sec:authorize>

                <div class="md:col-span-2 mt-2">
                    <button type="submit" class="w-full md:w-auto inline-flex items-center justify-center gap-2 rounded-lg bg-emerald-700 hover:bg-emerald-600 px-6 py-3.5 text-sm font-bold text-white transition-all duration-200">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                          <path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.603 10.602Z" />
                        </svg>
                        Rechercher
                    </button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>