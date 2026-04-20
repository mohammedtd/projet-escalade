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
            <h1 class="text-2xl font-extrabold text-slate-900 md:text-4xl">Bienvenue sur le catalogue des sorties du club d'escalade</h1>
            <p class="mt-2 text-slate-600">Un espace clair pour explorer, filtrer et gérer les sorties.</p>
        </header>

        <section class="mb-8 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <h2 class="mb-4 text-xl font-bold text-slate-900">Navigation</h2>
            <div class="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
                <a href="<c:url value='/categories' />" class="rounded-xl border border-slate-200 bg-white px-4 py-3 font-medium text-slate-700 transition hover:bg-slate-50">Voir les catégories</a>
                <a href="<c:url value='/sorties' />" class="rounded-xl border border-slate-200 bg-white px-4 py-3 font-medium text-slate-700 transition hover:bg-slate-50">Voir les sorties</a>

                <sec:authorize access="isAuthenticated()">
                    <a href="<c:url value='/createur' />" class="rounded-xl border border-slate-200 bg-white px-4 py-3 font-medium text-slate-700 transition hover:bg-slate-50">Créateurs & sorties</a>
                    <a href="<c:url value='/choix' />" class="rounded-xl border border-slate-200 bg-white px-4 py-3 font-medium text-slate-700 transition hover:bg-slate-50">Gérer mes sorties</a>
                    <form action="<c:url value='/logout' />" method="post" class="sm:col-span-2 lg:col-span-1">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="w-full rounded-xl bg-slate-700 px-4 py-3 font-semibold text-white transition hover:bg-slate-800">Se déconnecter</button>
                    </form>
                </sec:authorize>
            </div>
        </section>

        <section class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <h2 class="mb-5 text-xl font-bold text-slate-900">Recherche de sorties</h2>

            <form action="<c:url value='/sorties/search' />" method="get" class="grid gap-4 md:grid-cols-2">
                <div>
                    <label for="nom" class="mb-2 block text-sm font-medium text-slate-700">Nom de la sortie</label>
                    <select id="nom" name="nom" class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none">
                        <option value="">-- Toutes les sorties --</option>
                        <c:forEach var="sortie" items="${sorties}">
                            <option value="${sortie.nomSortie}">
                                <c:out value="${sortie.nomSortie}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                    <label for="categorieId" class="mb-2 block text-sm font-medium text-slate-700">Catégorie</label>
                    <select id="categorieId" name="categorieId" class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none">
                        <option value="">-- Toutes les catégories --</option>
                        <c:forEach var="categorie" items="${categories}">
                            <option value="${categorie.categorieID}">
                                <c:out value="${categorie.categorieName}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                    <label for="dateSortie" class="mb-2 block text-sm font-medium text-slate-700">Date de sortie</label>
                    <input type="date" id="dateSortie" name="dateSortie" class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none">
                </div>

                <sec:authorize access="isAuthenticated()">
                    <div>
                        <label for="createurId" class="mb-2 block text-sm font-medium text-slate-700">Créateur</label>
                        <select id="createurId" name="createurId" class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none">
                            <option value="">-- Tous les créateurs --</option>
                            <c:forEach var="membre" items="${membres}">
                                <option value="${membre.membreID}">
                                    <c:out value="${membre.prenom}" />
                                    <c:out value=" " />
                                    <c:out value="${membre.nom}" />
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </sec:authorize>

                <div class="md:col-span-2">
                    <button type="submit" class="inline-flex items-center justify-center rounded-xl bg-blue-600 px-6 py-3 font-semibold text-white transition hover:bg-blue-700">
                        Rechercher
                    </button>
                </div>
            </form>
        </section>
    </main>
</body>
</html>