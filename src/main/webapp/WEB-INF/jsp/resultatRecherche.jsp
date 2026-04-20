<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Résultat de recherche</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800">
    <main class="mx-auto max-w-5xl px-4 py-10 md:px-6">
        <header class="mb-8 flex flex-col gap-4 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm md:flex-row md:items-center md:justify-between">
            <h1 class="text-2xl font-extrabold text-slate-900 md:text-3xl">Résultat de la recherche</h1>
            <a href="<c:url value='/home' />" class="inline-flex items-center rounded-xl border border-slate-300 bg-white px-4 py-2 font-medium text-slate-700 transition hover:bg-slate-50">
                ← Retour à l'accueil
            </a>
        </header>

        <c:if test="${empty sorties}">
            <div class="rounded-2xl border border-slate-200 bg-white p-6 text-center text-slate-600 shadow-sm">
                Aucune sortie ne correspond à ce critère.
            </div>
        </c:if>

        <c:if test="${not empty sorties}">
            <ul class="space-y-4">
                <c:forEach var="sortie" items="${sorties}">
                    <li class="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                        <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="text-lg font-semibold text-slate-900 hover:text-blue-700 hover:underline">
                            <c:out value="${sortie.nomSortie}" />
                        </a>

                        <div class="mt-3 space-y-1 text-slate-700">
                            <p><strong>Date :</strong> <c:out value="${sortie.dateSortie}" /></p>
                            <p><strong>Catégorie :</strong> <c:out value="${sortie.categorie.categorieName}" /></p>

                            <sec:authorize access="isAuthenticated()">
                                <p>
                                    <strong>Créateur :</strong>
                                    <c:out value="${sortie.createur.prenom}" />
                                    <c:out value=" " />
                                    <c:out value="${sortie.createur.nom}" />
                                </p>
                            </sec:authorize>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </main>
</body>
</html>