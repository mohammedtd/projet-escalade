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

    <sec:authorize access="isAuthenticated()">
        <main class="mx-auto max-w-4xl px-4 py-8 md:px-6 md:py-12">
            
            <!-- Header -->
            <header class="mb-8 flex flex-col gap-4 rounded-3xl border border-slate-800 bg-slate-900/40 p-6 backdrop-blur-xl shadow-2xl sm:flex-row sm:items-center sm:justify-between">
                <div>
                    <h1 class="text-2xl font-extrabold text-white md:text-3xl">Créateurs & Sorties</h1>
                    <p class="text-xs text-slate-400 mt-1">Découvrez les membres actifs organisant des événements de grimpe</p>
                </div>
                <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-2 rounded-2xl border border-slate-700 bg-slate-800/40 px-5 py-2.5 font-bold text-slate-300 transition hover:bg-slate-800 hover:text-white hover:border-slate-600 backdrop-blur-sm shrink-0">
                    ← Accueil
                </a>
            </header>

            <c:if test="${empty membres}">
                <div class="rounded-3xl border border-slate-800 bg-slate-900/40 p-12 text-center text-slate-400 backdrop-blur-xl shadow-2xl">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-12 h-12 text-slate-600 mx-auto mb-4">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
                    </svg>
                    Aucun membre créateur répertorié.
                </div>
            </c:if>

            <c:if test="${not empty membres}">
                <div class="space-y-6">
                    <c:forEach var="membre" items="${membres}">
                        <c:if test="${not empty membre.sorties}">
                            <section class="rounded-3xl border border-slate-800 bg-slate-900/30 p-6 shadow-xl backdrop-blur-md">
                                <div class="flex items-center gap-3 border-b border-slate-800/80 pb-4 mb-4">
                                    <div class="flex h-10 w-10 items-center justify-center rounded-2xl bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 font-bold">
                                        <c:out value="${membre.prenom.charAt(0)}" />
                                    </div>
                                    <div>
                                        <h2 class="text-lg font-bold text-white leading-none">
                                            <c:out value="${membre.prenom}" /> <c:out value="${membre.nom}" />
                                        </h2>
                                        <span class="text-[10px] text-slate-500 uppercase tracking-widest font-semibold mt-1 block">Créateur Actif</span>
                                    </div>
                                </div>
                                
                                <ul class="space-y-2">
                                    <c:forEach var="sortie" items="${membre.sorties}">
                                        <li>
                                            <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="group flex items-center justify-between rounded-xl bg-slate-950/40 px-4 py-3 hover:bg-slate-900/40 hover:border-slate-800 border border-transparent transition-all duration-300">
                                                <div class="flex items-center gap-2.5">
                                                    <span class="text-emerald-400 group-hover:scale-110 transition duration-300">🧗</span>
                                                    <span class="text-sm font-bold text-slate-300 group-hover:text-white transition duration-300">
                                                        <c:out value="${sortie.nomSortie}" />
                                                    </span>
                                                </div>
                                                <span class="text-slate-600 group-hover:text-emerald-400 group-hover:translate-x-0.5 transition duration-300">→</span>
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