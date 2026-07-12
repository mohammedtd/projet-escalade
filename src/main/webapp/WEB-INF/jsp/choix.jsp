<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gérer mes sorties — Club d'Escalade</title>
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

    <main class="mx-auto max-w-5xl px-4 py-8 md:px-6 md:py-12">
        
        <!-- Header -->
        <header class="mb-8 rounded-3xl border border-slate-800 bg-slate-900/40 p-6 backdrop-blur-xl shadow-2xl relative">
            <h1 class="text-2xl font-extrabold text-white md:text-3xl leading-tight">Gestion de mes sorties</h1>
            <p class="mt-2 text-slate-400 text-sm">
                Bonjour, 
                <strong class="text-white">
                    <c:out value="${membre.prenom}" /> <c:out value="${membre.nom}" />
                </strong>
            </p>
            <div class="mt-5 flex flex-wrap gap-2.5">
                <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-1.5 rounded-2xl border border-slate-800 bg-slate-950/40 px-4 py-2 text-xs font-bold text-slate-300 hover:bg-slate-900 hover:text-white hover:border-slate-700 transition duration-300">
                    ← Accueil
                </a>
                <a href="<c:url value='/choix/ajouter' />" class="inline-flex items-center justify-center gap-1.5 rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-600 px-4 py-2 text-xs font-bold text-white hover:from-emerald-400 hover:to-teal-500 transition duration-300 shadow-lg shadow-emerald-950/20">
                    + Nouvelle sortie
                </a>
            </div>
        </header>

        <c:if test="${empty sortiesCreees and empty sortiesRejointes}">
            <div class="rounded-3xl border border-slate-800 bg-slate-900/40 p-12 text-center text-slate-400 backdrop-blur-xl shadow-2xl">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-12 h-12 text-slate-600 mx-auto mb-4">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
                </svg>
                Tu n'as encore créé ni rejoint aucune sortie de grimpe.
            </div>
        </c:if>

        <!-- Created Outputs -->
        <c:if test="${not empty sortiesCreees}">
            <div class="mb-10">
                <h2 class="mb-5 text-lg font-bold uppercase tracking-wider text-slate-400 flex items-center gap-2">
                    <span class="h-2 w-2 rounded-full bg-emerald-400"></span>
                    Mes sorties créées
                </h2>
                
                <div class="grid gap-4 sm:grid-cols-2">
                    <c:forEach var="sortie" items="${sortiesCreees}">
                        <div class="rounded-3xl border border-slate-800 bg-slate-900/30 p-6 shadow-xl backdrop-blur-md flex flex-col justify-between hover:border-slate-700 transition duration-300">
                            <div>
                                <h3 class="text-lg font-bold text-white mb-2"><c:out value="${sortie.nomSortie}" /></h3>
                                <p class="text-slate-400 text-xs line-clamp-2 mb-4 leading-relaxed"><c:out value="${sortie.description}" /></p>
                                
                                <div class="space-y-1.5 text-xs text-slate-400 border-t border-slate-800/80 pt-3 mb-4">
                                    <p><strong>Date :</strong> <c:out value="${sortie.dateSortie}" /></p>
                                    <p><strong>Catégorie :</strong> <c:out value="${sortie.categorie.categorieName}" /></p>
                                    <p>
                                        <strong>Site Web :</strong>
                                        <c:if test="${not empty sortie.siteWeb}">
                                            <a href="${sortie.siteWeb}" target="_blank" class="text-emerald-400 hover:underline">Visiter</a>
                                        </c:if>
                                        <c:if test="${empty sortie.siteWeb}">
                                            <span class="text-slate-600">Aucun</span>
                                        </c:if>
                                    </p>
                                </div>
                            </div>

                            <div class="flex gap-2">
                                <a href="<c:url value='/choix/modifier/${sortie.sortieID}' />" class="flex-1 inline-flex items-center justify-center rounded-2xl border border-slate-800 bg-slate-950/40 px-3 py-2 text-xs font-bold text-slate-300 hover:bg-slate-900 hover:text-white transition duration-300">
                                    Modifier
                                </a>
                                
                                <form action="<c:url value='/choix/supprimer/${sortie.sortieID}' />" method="post" class="flex-1">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <button type="submit" class="w-full inline-flex items-center justify-center rounded-2xl border border-red-500/20 bg-red-500/10 px-3 py-2 text-xs font-bold text-red-400 hover:bg-red-500/20 hover:text-red-300 transition duration-300">
                                        Supprimer
                                    </button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- Joined Outputs -->
        <c:if test="${not empty sortiesRejointes}">
            <div>
                <h2 class="mb-5 text-lg font-bold uppercase tracking-wider text-slate-400 flex items-center gap-2">
                    <span class="h-2 w-2 rounded-full bg-indigo-400"></span>
                    Sorties rejointes
                </h2>
                
                <div class="grid gap-4 sm:grid-cols-2">
                    <c:forEach var="sortie" items="${sortiesRejointes}">
                        <div class="rounded-3xl border border-slate-800 bg-slate-900/30 p-6 shadow-xl backdrop-blur-md flex flex-col justify-between hover:border-slate-700 transition duration-300">
                            <div>
                                <div class="mb-3 inline-flex rounded-full bg-indigo-500/10 border border-indigo-500/20 px-3 py-1 text-[10px] font-semibold tracking-wider uppercase text-indigo-400">
                                    Participant
                                </div>
                                <h3 class="text-lg font-bold text-white mb-2"><c:out value="${sortie.nomSortie}" /></h3>
                                <p class="text-slate-400 text-xs line-clamp-2 mb-4 leading-relaxed"><c:out value="${sortie.description}" /></p>
                                
                                <div class="space-y-1.5 text-xs text-slate-400 border-t border-slate-800/80 pt-3 mb-4">
                                    <p><strong>Date :</strong> <c:out value="${sortie.dateSortie}" /></p>
                                    <p><strong>Catégorie :</strong> <c:out value="${sortie.categorie.categorieName}" /></p>
                                    <p><strong>Créateur :</strong> <c:out value="${sortie.createur.prenom}" /> <c:out value="${sortie.createur.nom}" /></p>
                                </div>
                            </div>

                            <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="w-full inline-flex items-center justify-center rounded-2xl border border-slate-800 bg-slate-950/40 px-3 py-2 text-xs font-bold text-slate-300 hover:bg-slate-900 hover:text-white transition duration-300">
                                Voir le détail
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </main>
</body>
</html>