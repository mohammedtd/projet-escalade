<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Créateurs et leurs sorties</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800">
    <sec:authorize access="isAuthenticated()">
        <main class="mx-auto max-w-5xl px-4 py-10 md:px-6">
            <header class="mb-8 flex flex-col gap-4 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm md:flex-row md:items-center md:justify-between">
                <h1 class="text-2xl font-extrabold text-slate-900 md:text-3xl">Liste des créateurs et leurs sorties</h1>
                <a href="<c:url value='/home' />" class="inline-flex items-center rounded-xl border border-slate-300 bg-white px-4 py-2 font-medium text-slate-700 transition hover:bg-slate-50">
                    ← Retour à l'accueil
                </a>
            </header>

            <c:if test="${empty membres}">
                <div class="rounded-2xl border border-slate-200 bg-white p-6 text-center text-slate-600 shadow-sm">
                    Aucun créateur disponible.
                </div>
            </c:if>

            <c:if test="${not empty membres}">
                <div class="space-y-5">
                    <c:forEach var="membre" items="${membres}">
                        <c:if test="${not empty membre.sorties}">
                            <section class="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
                                <h2 class="mb-3 text-xl font-bold text-slate-900">
                                    <c:out value="${membre.prenom}" />
                                    <c:out value=" " />
                                    <c:out value="${membre.nom}" />
                                </h2>
                                <ul class="space-y-2">
                                    <c:forEach var="sortie" items="${membre.sorties}">
                                        <li>
                                            <a href="<c:url value='/sorties/${sortie.sortieID}' />" class="inline-flex items-center gap-2 text-blue-600 transition hover:text-blue-700 hover:underline">
                                                <span>🧗</span>
                                                <c:out value="${sortie.nomSortie}" />
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