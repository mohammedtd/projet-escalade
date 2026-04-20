<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Formulaire sortie</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800">
    <main class="mx-auto max-w-3xl px-4 py-10 md:px-6">
        <section class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <h1 class="mb-6 text-2xl font-extrabold text-slate-900 md:text-3xl">Formulaire sortie</h1>

            <form method="post" class="space-y-4">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                <div>
                    <label class="mb-2 block text-sm font-medium text-slate-700" for="nomSortie">Nom</label>
                    <input id="nomSortie" type="text" name="nomSortie" value="${sortie.nomSortie}" required class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none" />
                </div>

                <div>
                    <label class="mb-2 block text-sm font-medium text-slate-700" for="description">Description</label>
                    <input id="description" type="text" name="description" value="${sortie.description}" required class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none" />
                </div>

                <div>
                    <label class="mb-2 block text-sm font-medium text-slate-700" for="siteWeb">Site Web</label>
                    <input id="siteWeb" type="text" name="siteWeb" value="${sortie.siteWeb}" class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none" />
                </div>

                <div>
                    <label class="mb-2 block text-sm font-medium text-slate-700" for="dateSortie">Date</label>
                    <input id="dateSortie" type="date" name="dateSortie" value="${sortie.dateSortie}" required class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none" />
                </div>

                <div>
                    <label class="mb-2 block text-sm font-medium text-slate-700" for="categorieId">Catégorie</label>
                    <select id="categorieId" name="categorieId" class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none">
                        <c:forEach var="cat" items="${categories}">
                            <option value="${cat.categorieID}">
                                ${cat.categorieName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="inline-flex items-center justify-center rounded-xl bg-blue-600 px-6 py-3 font-semibold text-white transition hover:bg-blue-700">
                    Valider
                </button>
            </form>
        </section>
    </main>
</body>
</html>