<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Sorties de la catégorie</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800">
    <main class="mx-auto max-w-4xl px-4 py-10 md:px-6">
        <header class="mb-8 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <h1 class="text-2xl font-extrabold text-slate-900 md:text-3xl">
                Sorties de la catégorie :
                <c:out value="${categorie.categorieName}" />
            </h1>
            <div class="mt-4 flex flex-wrap gap-3">
                <a href="<c:url value='/categories' />" class="rounded-xl border border-slate-300 bg-white px-4 py-2 font-medium text-slate-700 transition hover:bg-slate-50">← Retour aux catégories</a>
                <a href="<c:url value='/home' />" class="rounded-xl border border-slate-300 bg-white px-4 py-2 font-medium text-slate-700 transition hover:bg-slate-50">⌂ Retour à l'accueil</a>
            </div>
        </header>

        <c:if test="${empty sorties}">
            <div class="rounded-2xl border border-slate-200 bg-white p-6 text-center text-slate-600 shadow-sm">
                Aucune sortie trouvée pour cette catégorie.
            </div>
        </c:if>

        <c:if test="${not empty sorties}">
            <ul class="space-y-4">
                <c:forEach var="sortie" items="${sorties}">
                    <li>
                        <a href="<c:url value='/sorties/${sortie.sortieID}' />"
                           class="group flex items-center justify-between gap-3 rounded-2xl border border-slate-200 bg-white p-5 shadow-sm transition hover:-translate-y-0.5 hover:border-blue-200 hover:bg-blue-50/40">
                            <span class="truncate text-lg font-semibold text-slate-900">
                                <c:out value="${sortie.nomSortie}" />
                            </span>
                            <span class="text-blue-600 transition group-hover:translate-x-1">→</span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </main>
</body>
</html>