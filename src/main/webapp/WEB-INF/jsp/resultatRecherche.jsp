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
    <div class="absolute top-0 right-1/4 -z-10 h-[300px] w-[40%] rounded-full bg-emerald-500/5 blur-[120px]"></div>

    <main class="mx-auto max-w-4xl px-4 py-8 md:px-6 md:py-12">
        
        <!-- Header -->
        <header class="mb-8 flex flex-col gap-4 rounded-3xl border border-slate-800 bg-slate-900/40 p-6 backdrop-blur-xl shadow-2xl sm:flex-row sm:items-center sm:justify-between">
            <div>
                <h1 class="text-2xl font-extrabold text-white md:text-3xl">Résultats de la recherche</h1>
                <p class="text-xs text-slate-400 mt-1">Voici les aventures correspondant à vos critères</p>
            </div>
            <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-2 rounded-2xl border border-slate-700 bg-slate-800/40 px-5 py-2.5 font-bold text-slate-300 transition hover:bg-slate-800 hover:text-white hover:border-slate-600 backdrop-blur-sm shrink-0">
                ← Retour
            </a>
        </header>

        <c:if test="${empty sorties}">
            <div class="rounded-3xl border border-slate-800 bg-slate-900/40 p-12 text-center text-slate-400 backdrop-blur-xl shadow-2xl">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-12 h-12 text-slate-600 mx-auto mb-4">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
                </svg>
                Aucune sortie ne correspond à ces critères de recherche.
            </div>
        </c:if>

        <c:if test="${not empty sorties}">
            <ul class="space-y-4">
                <c:forEach var="sortie" items="${sorties}">
                    <li class="group rounded-2xl border border-slate-800/60 bg-slate-900/30 p-6 shadow-lg transition-all duration-300 hover:border-emerald-500/30 hover:bg-slate-900/50">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="text-lg font-bold text-white hover:text-emerald-400 transition-colors">
                                    <c:out value="${sortie.nomSortie}" />
                                </a>
                                
                                <div class="mt-4 flex flex-wrap gap-x-6 gap-y-2 text-xs text-slate-400">
                                    <span class="flex items-center gap-1.5">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-3.5 h-3.5 text-emerald-400">
                                          <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" />
                                        </svg>
                                        <c:out value="${sortie.dateSortie}" />
                                    </span>
                                    <span class="flex items-center gap-1.5">
                                        <span class="h-1.5 w-1.5 rounded-full bg-emerald-400"></span>
                                        <c:out value="${sortie.categorie.categorieName}" />
                                    </span>
                                    <sec:authorize access="isAuthenticated()">
                                        <span class="flex items-center gap-1.5">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-3.5 h-3.5 text-emerald-400">
                                              <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                                            </svg>
                                            <c:out value="${sortie.createur.prenom}" /> <c:out value="${sortie.createur.nom}" />
                                        </span>
                                    </sec:authorize>
                                </div>
                            </div>
                            <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="inline-flex items-center justify-center h-10 w-10 rounded-xl bg-slate-800 text-slate-400 group-hover:bg-emerald-500 group-hover:text-white transition-all duration-300 shadow-md">
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
