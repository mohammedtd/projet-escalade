<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultats de Recherche — Club d'Escalade</title>
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

    <main class="mx-auto max-w-4xl px-6 py-12">
        
        <!-- Header -->
        <header class="mb-8 flex flex-col gap-4 rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 shadow-md sm:flex-row sm:items-center sm:justify-between">
            <div>
                <h1 class="text-2xl font-extrabold text-white tracking-tight">Résultats de la recherche</h1>
                <p class="text-xs text-zinc-400 mt-1">Voici les aventures correspondant à vos critères</p>
            </div>
            <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-1.5 rounded-lg border border-zinc-800 bg-zinc-900/60 hover:bg-zinc-800 px-4 py-2.5 text-xs font-bold text-zinc-300 transition duration-150 shrink-0">
                ← Retour
            </a>
        </header>

        <c:if test="${empty sorties}">
            <div class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-12 text-center text-zinc-500 shadow-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-8 h-8 text-zinc-650 mx-auto mb-3">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
                </svg>
                Aucune sortie ne correspond à ces critères de recherche.
            </div>
        </c:if>

        <c:if test="${not empty sorties}">
            <ul class="space-y-3">
                <c:forEach var="sortie" items="${sorties}">
                    <li class="group rounded-xl border border-zinc-850 bg-zinc-900/10 p-5 shadow-sm transition duration-150 hover:border-emerald-700/50 hover:bg-zinc-900/50">
                        <div class="flex items-center justify-between gap-4">
                            <div>
                                <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="text-base font-bold text-white hover:text-emerald-400 transition-colors">
                                    <c:out value="${sortie.nomSortie}" />
                                </a>
                                
                                <div class="mt-3 flex flex-wrap gap-x-5 gap-y-1.5 text-xs text-zinc-400">
                                    <span class="flex items-center gap-1.5">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-3.5 h-3.5 text-emerald-500">
                                          <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" />
                                        </svg>
                                        <c:out value="${sortie.dateSortie}" />
                                    </span>
                                    <span class="flex items-center gap-1.5">
                                        <span class="h-1.5 w-1.5 rounded-full bg-emerald-600"></span>
                                        <c:out value="${sortie.categorie.categorieName}" />
                                    </span>
                                    <sec:authorize access="isAuthenticated()">
                                        <span class="flex items-center gap-1.5">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-3.5 h-3.5 text-emerald-500">
                                              <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                                            </svg>
                                            <c:out value="${sortie.createur.prenom}" /> <c:out value="${sortie.createur.nom}" />
                                        </span>
                                    </sec:authorize>
                                </div>
                            </div>
                            <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="inline-flex items-center justify-center h-8 w-8 rounded-lg bg-zinc-900 text-zinc-400 group-hover:bg-emerald-700 group-hover:text-white transition duration-150 shadow-sm shrink-0">
                                →
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </main>
</body>
</html>