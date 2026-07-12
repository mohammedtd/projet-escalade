<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gérer mes sorties</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800">
    <main class="mx-auto max-w-5xl px-4 py-10 md:px-6">
        <header class="mb-6 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <h1 class="text-2xl font-extrabold text-slate-900 md:text-3xl">Gestion de mes sorties</h1>
            <p class="mt-2 text-slate-600">
                Bonjour
                <strong>
                    <c:out value="${membre.prenom}" />
                    <c:out value=" " />
                    <c:out value="${membre.nom}" />
                </strong>
            </p>
            <div class="mt-5 flex flex-wrap gap-3">
                <a href="<c:url value='/home' />" class="rounded-xl border border-slate-300 bg-white px-4 py-2 font-medium text-slate-700 transition hover:bg-slate-50">← Retour à l'accueil</a>
                <a href="<c:url value='/choix/ajouter' />" class="rounded-xl bg-blue-600 px-4 py-2 font-semibold text-white transition hover:bg-blue-700">+ Créer une nouvelle sortie</a>
            </div>
        </header>

        <c:if test="${empty sortiesCreees and empty sortiesRejointes}">
            <div class="rounded-2xl border border-slate-200 bg-white p-6 text-center text-slate-600 shadow-sm">
                Vous n'avez encore créé ni rejoint aucune sortie.
            </div>
        </c:if>

        <c:if test="${not empty sortiesCreees}">
            <h2 class="mb-4 text-xl font-bold text-slate-900">Mes sorties créées</h2>
            <ul class="space-y-4">
                <c:forEach var="sortie" items="${sortiesCreees}">
                    <li class="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                        <p><strong>Nom :</strong> <c:out value="${sortie.nomSortie}" /></p>
                        <p><strong>Description :</strong> <c:out value="${sortie.description}" /></p>
                        <p><strong>Date :</strong> <c:out value="${sortie.dateSortie}" /></p>
                        <p><strong>Catégorie :</strong> <c:out value="${sortie.categorie.categorieName}" /></p>
                        <p>
                            <strong>Site Web :</strong>
                            <c:if test="${not empty sortie.siteWeb}">
                                <a href="${sortie.siteWeb}" target="_blank" class="text-blue-600 underline hover:text-blue-700">Voir le site</a>
                            </c:if>
                            <c:if test="${empty sortie.siteWeb}">
                                <span class="text-slate-500">Non disponible</span>
                            </c:if>
                        </p>

                        <div class="mt-4 flex flex-wrap gap-3">
                            <a href="<c:url value='/choix/modifier/${sortie.sortieID}' />" class="rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm font-medium text-slate-700 transition hover:bg-slate-50">
                                Modifier
                            </a>

                            <form action="<c:url value='/choix/supprimer/${sortie.sortieID}' />" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="rounded-lg bg-red-700/80 px-3 py-2 text-sm font-semibold text-white transition hover:bg-rose-500">Supprimer</button>
                            </form>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <c:if test="${not empty sortiesRejointes}">
            <h2 class="mb-4 mt-8 text-xl font-bold text-slate-900">Sorties rejointes</h2>
            <ul class="space-y-4">
                <c:forEach var="sortie" items="${sortiesRejointes}">
                    <li class="rounded-2xl border border-emerald-200 bg-emerald-50/40 p-5 shadow-sm">
                        <div class="mb-2 inline-flex rounded-full bg-emerald-100 px-3 py-1 text-xs font-semibold text-emerald-700">
                            Vous êtes participant (pas créateur)
                        </div>
                        <p><strong>Nom :</strong> <c:out value="${sortie.nomSortie}" /></p>
                        <p><strong>Description :</strong> <c:out value="${sortie.description}" /></p>
                        <p><strong>Date :</strong> <c:out value="${sortie.dateSortie}" /></p>
                        <p><strong>Catégorie :</strong> <c:out value="${sortie.categorie.categorieName}" /></p>
                        <p>
                            <strong>Créateur :</strong>
                            <c:out value="${sortie.createur.prenom}" />
                            <c:out value=" " />
                            <c:out value="${sortie.createur.nom}" />
                        </p>

                        <div class="mt-4">
                            <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm font-medium text-slate-700 transition hover:bg-slate-50">
                                Voir le détail
                            </a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </main>
</body>
</html>