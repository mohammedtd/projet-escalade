<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créateurs & Sorties — Club d'Escalade</title>
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
        <main class="mx-auto max-w-4xl px-6 py-12">
            
            <!-- Header -->
            <header class="mb-8 flex flex-col gap-4 rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 shadow-md sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h1 class="text-2xl font-extrabold text-white tracking-tight">Créateurs & Sorties</h1>
                    <p class="text-xs text-zinc-400 mt-1">Découvrez les membres actifs organisant des événements de grimpe</p>
                </div>
                <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-1.5 rounded-lg border border-zinc-800 bg-zinc-900/60 px-4 py-2.5 text-xs font-bold text-zinc-300 hover:bg-zinc-800 hover:text-white transition duration-150 shrink-0">
                    ← Accueil
                </a>
            </header>

            <c:if test="${empty membres}">
                <div class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-12 text-center text-zinc-550 shadow-md">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-8 h-8 text-zinc-650 mx-auto mb-3">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
                    </svg>
                    Aucun membre créateur répertorié.
                </div>
            </c:if>

            <c:if test="${not empty membres}">
                <div class="space-y-6">
                    <c:forEach var="membre" items="${membres}">
                        <c:if test="${not empty membre.sorties}">
                            <section class="rounded-xl border border-zinc-800 bg-zinc-900/10 p-6 shadow-sm">
                                <div class="flex items-center gap-3 border-b border-zinc-850 pb-4 mb-4">
                                    <div class="flex h-9 w-9 items-center justify-center rounded-lg bg-zinc-950 text-emerald-400 border border-zinc-800 text-xs font-bold uppercase tracking-wider">
                                        <c:out value="${membre.prenom.charAt(0)}" />
                                    </div>
                                    <div>
                                        <h2 class="text-sm font-bold text-white leading-none">
                                            <c:out value="${membre.prenom}" /> <c:out value="${membre.nom}" />
                                        </h2>
                                        <span class="text-[9px] text-zinc-550 uppercase tracking-widest font-bold mt-1 block">Créateur</span>
                                    </div>
                                </div>
                                
                                <ul class="space-y-2">
                                    <c:forEach var="sortie" items="${membre.sorties}">
                                        <li>
                                            <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="group flex items-center justify-between rounded-lg bg-zinc-950/40 px-4 py-3 hover:border-zinc-850 border border-transparent transition duration-150">
                                                <div class="flex items-center gap-2.5">
                                                    <span class="text-emerald-500 text-xs">🧗</span>
                                                    <span class="text-xs font-bold text-zinc-300 group-hover:text-white transition duration-150">
                                                        <c:out value="${sortie.nomSortie}" />
                                                    </span>
                                                </div>
                                                <span class="text-zinc-650 group-hover:text-emerald-400 group-hover:translate-x-0.5 transition duration-150 text-xs">→</span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </section>
                        </c:if>
                    </c:forEach>
                </div>
            </c:if>
        </main>
    </sec:authorize>
</body>
</html>