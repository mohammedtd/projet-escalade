<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes Activités — Club d'Escalade</title>
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

    <sec:authorize access="isAuthenticated()">
        <main class="mx-auto max-w-5xl px-6 py-12">
            
            <!-- Header -->
            <header class="mb-8 rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 md:p-8 shadow-md">
                <div class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                    <div>
                        <h1 class="text-2xl font-extrabold text-white tracking-tight">Mes Activités</h1>
                        <p class="text-xs text-zinc-400 mt-1">
                            Bonjour <c:out value="${membre.prenom}" /> <c:out value="${membre.nom}" />. Gérez vos participations et organisez de nouvelles sorties.
                        </p>
                    </div>

                    <div class="flex flex-wrap gap-2">
                        <a href="<c:url value='/choix/ajouter' />" class="inline-flex items-center justify-center gap-1.5 rounded-lg bg-emerald-700 hover:bg-emerald-600 px-4 py-2.5 text-xs font-bold text-white transition duration-150 shadow-sm">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                            </svg>
                            Créer une sortie
                        </a>
                        <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-1.5 rounded-lg border border-zinc-800 bg-zinc-900/60 px-4 py-2.5 text-xs font-bold text-zinc-300 hover:bg-zinc-800 hover:text-white transition duration-150">
                            ← Accueil
                        </a>
                    </div>
                </div>
            </header>

            <c:if test="${empty sortiesCreees and empty sortiesRejointes}">
                <div class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-12 text-center text-zinc-500 shadow-md mb-8">
                    Vous n'avez pas encore créé ou rejoint de sortie.
                </div>
            </c:if>

            <div class="grid gap-8 lg:grid-cols-2">
                
                <!-- Created Sorties -->
                <c:if test="${not empty sortiesCrees}">
                    <section class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 shadow-md">
                        <h2 class="mb-5 text-sm font-bold uppercase tracking-wider text-emerald-500 flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M11.42 15.17 17.25 21A2.65 2.65 0 0 0 21 17.25l-5.83-5.83m-3.75 3.75a3.75 3.75 0 1 1-5.3-5.3m5.3 5.3a3.75 3.75 0 0 0-5.3-5.3m0 0c-.461-.462-.724-1.1-.724-1.75a2.65 2.65 0 0 1 5.3 0c0 .65-.262 1.288-.724 1.75m-5.3 0-1.89-1.89m7.19 1.89 1.89-1.89m-7.19 0h7.19" />
                            </svg>
                            Mes sorties créées
                        </h2>
                        
                        <ul class="space-y-3">
                            <c:forEach var="sortie" items="${sortiesCreees}">
                                <li class="rounded-lg border border-zinc-850 bg-zinc-950/40 p-4 hover:border-zinc-800 transition duration-150">
                                    <div class="flex items-center justify-between gap-3">
                                        <span class="text-sm font-bold text-zinc-200 truncate"><c:out value="${sortie.nomSortie}" /></span>
                                        <div class="flex items-center gap-1.5 shrink-0">
                                            <a href="<c:url value='/choix/modifier/${sortie.sortieID}' />" class="inline-flex h-8 w-8 items-center justify-center rounded bg-zinc-900 border border-zinc-800 text-zinc-400 hover:text-emerald-500 transition duration-150" title="Modifier">
                                                ✏️
                                            </a>
                                            <form action="<c:url value='/choix/supprimer/${sortie.sortieID}' />" method="post" onsubmit="return confirm('Confirmer la suppression de cette sortie ?');" class="inline">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <button type="submit" class="inline-flex h-8 w-8 items-center justify-center rounded bg-red-950/20 border border-red-950/60 text-red-400 hover:bg-red-950/40 transition duration-150" title="Supprimer">
                                                    🗑️
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="mt-2 text-xs text-zinc-400">
                                        Date: <c:out value="${sortie.dateSortie}" /> | Discipline: <c:out value="${sortie.categorie.categorieName}" />
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </section>
                </c:if>

                <!-- Joined Sorties -->
                <c:if test="${not empty sortiesRejointes}">
                    <section class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 shadow-md">
                        <h2 class="mb-5 text-sm font-bold uppercase tracking-wider text-emerald-500 flex items-center gap-2">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                              <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 0 0 3.741-.479 3 3 0 0 0-4.682-2.72m.94 3.198.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0 1 12 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 0 1 6 18.719m12 0a5.971 5.971 0 0 0-.941-3.197m0 0A5.995 5.995 0 0 0 12 12.75a5.995 5.995 0 0 0-5.058 2.772m0 0a3 3 0 0 0-4.681 2.72 8.986 8.986 0 0 0 3.74.477m.94-3.197a5.971 5.971 0 0 0-.94 3.197M15 6.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm6 3a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Zm-13.5 0a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Z" />
                            </svg>
                            Sorties rejointes
                        </h2>
                        
                        <ul class="space-y-3">
                            <c:forEach var="sortie" items="${sortiesRejointes}">
                                <li class="rounded-lg border border-zinc-850 bg-zinc-950/40 p-4 hover:border-zinc-800 transition duration-150">
                                    <div class="flex items-center justify-between gap-3">
                                        <span class="text-sm font-bold text-zinc-200 truncate"><c:out value="${sortie.nomSortie}" /></span>
                                        <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="inline-flex h-8 w-8 items-center justify-center rounded bg-zinc-900 border border-zinc-800 text-zinc-400 hover:text-emerald-500 transition duration-150 shrink-0" title="Consulter">
                                            👁️
                                        </a>
                                    </div>
                                    <div class="mt-2 text-xs text-zinc-400">
                                        Par: <c:out value="${sortie.createur.prenom}" /> <c:out value="${sortie.createur.nom}" /> | Date: <c:out value="${sortie.dateSortie}" />
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </section>
                </c:if>
            </div>
        </main>
    </sec:authorize>
</body>
</html>