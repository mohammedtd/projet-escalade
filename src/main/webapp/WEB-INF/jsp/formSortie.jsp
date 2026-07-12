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

    <main class="mx-auto max-w-2xl px-4 py-8 md:px-6 md:py-12">
        <section class="rounded-3xl border border-slate-800 bg-slate-900/40 p-6 md:p-8 backdrop-blur-xl shadow-2xl">
            
            <!-- Header/Back link -->
            <div class="mb-6">
                <a href="<c:url value='/choix' />" class="inline-flex items-center gap-2 text-xs font-semibold text-emerald-400 uppercase tracking-widest hover:text-emerald-300 transition-colors mb-2">
                    ← Annuler et retour
                </a>
                <h1 class="text-2xl font-extrabold text-white md:text-3xl">Détails de la Sortie</h1>
                <p class="text-xs text-slate-400 mt-1">Saisis les caractéristiques de ton aventure alpine ci-dessous.</p>
            </div>

            <form method="post" class="space-y-5">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <div>
                    <label class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2" for="nomSortie">Nom de la Sortie</label>
                    <input id="nomSortie" type="text" name="nomSortie" value="${sortie.nomSortie}" required placeholder="Ex: Grande Voie - Ailefroide" class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white placeholder-slate-600 focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all" />
                </div>

                <div>
                    <label class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2" for="description">Description / Programme</label>
                    <textarea id="description" name="description" required rows="3" placeholder="Présentation rapide du parcours, de la difficulté et du point de rdv..." class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white placeholder-slate-600 focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all">${sortie.description}</textarea>
                </div>

                <div>
                    <label class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2" for="siteWeb">Site Web Associé</label>
                    <input id="siteWeb" type="text" name="siteWeb" value="${sortie.siteWeb}" placeholder="https://..." class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white placeholder-slate-600 focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all" />
                </div>

                <div class="grid gap-4 sm:grid-cols-2">
                    <div>
                        <label class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2" for="dateSortie">Date prévue</label>
                        <input id="dateSortie" type="date" name="dateSortie" value="${sortie.dateSortie}" required class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all" />
                    </div>

                    <div>
                        <label class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2" for="categorieId">Discipline / Catégorie</label>
                        <select id="categorieId" name="categorieId" class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3 text-white focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all">
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categorieID}" class="bg-slate-900" <c:if test="${cat.categorieID == sortie.categorie.categorieID}">selected</c:if>>
                                    ${cat.categorieName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="pt-4">
                    <button type="submit" class="w-full sm:w-auto inline-flex items-center justify-center gap-2 rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-600 px-8 py-3.5 font-bold text-white transition-all duration-300 hover:from-emerald-400 hover:to-teal-500 hover:scale-[1.02] active:scale-[0.98] shadow-lg shadow-emerald-950/40">
                        Enregistrer la sortie
                    </button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>