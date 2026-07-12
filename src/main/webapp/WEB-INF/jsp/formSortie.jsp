<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire Sortie — Club d'Escalade</title>
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

    <main class="mx-auto max-w-2xl px-6 py-12">
        <section class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 md:p-8 shadow-md">
            
            <!-- Header/Back link -->
            <div class="mb-6">
                <a href="<c:url value='/choix' />" class="inline-flex items-center gap-1.5 text-xs font-bold text-emerald-500 uppercase tracking-wider hover:text-emerald-400 transition-colors mb-3">
                    ← Annuler et retour
                </a>
                <h1 class="text-2xl font-extrabold text-white tracking-tight">Détails de la Sortie</h1>
                <p class="text-xs text-zinc-400 mt-1">Saisissez les caractéristiques techniques de la sortie.</p>
            </div>

            <form method="post" class="space-y-4">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-zinc-400 mb-1.5" for="nomSortie">Nom de la Sortie</label>
                    <input id="nomSortie" type="text" name="nomSortie" value="${sortie.nomSortie}" required placeholder="Ex: Grande Voie - Ailefroide" class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white placeholder-zinc-700 focus:border-emerald-700 focus:outline-none transition-all" />
                </div>

                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-zinc-400 mb-1.5" for="description">Description / Programme</label>
                    <textarea id="description" name="description" required rows="4" placeholder="Présentation rapide du parcours, de la difficulté..." class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white placeholder-zinc-700 focus:border-emerald-700 focus:outline-none transition-all">${sortie.description}</textarea>
                </div>

                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-zinc-400 mb-1.5" for="siteWeb">Site Web</label>
                    <input id="siteWeb" type="text" name="siteWeb" value="${sortie.siteWeb}" placeholder="https://..." class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white placeholder-zinc-700 focus:border-emerald-700 focus:outline-none transition-all" />
                </div>

                <div class="grid gap-4 sm:grid-cols-2">
                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-zinc-400 mb-1.5" for="dateSortie">Date prévue</label>
                        <input id="dateSortie" type="date" name="dateSortie" value="${sortie.dateSortie}" required class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white focus:border-emerald-700 focus:outline-none transition-all" />
                    </div>

                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-zinc-400 mb-1.5" for="categorieId">Discipline / Catégorie</label>
                        <select id="categorieId" name="categorieId" class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white focus:border-emerald-700 focus:outline-none transition-all">
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categorieID}" class="bg-zinc-900" <c:if test="${cat.categorieID == sortie.categorie.categorieID}">selected</c:if>>
                                    ${cat.categorieName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="pt-4 border-t border-zinc-850">
                    <button type="submit" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-lg bg-emerald-700 hover:bg-emerald-600 px-6 py-3 text-xs font-bold text-white transition-all duration-200 shadow-sm">
                        Enregistrer la sortie
                    </button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>