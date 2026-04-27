<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Tag Spring Security pour gérer connecté / non connecté -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détail de la sortie</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800">
    <main class="mx-auto max-w-4xl px-4 py-10 md:px-6">
        <header class="mb-6 rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <h1 class="text-2xl font-extrabold text-slate-900 md:text-3xl">
                Détail de la sortie :
                <c:out value="${sortie.nomSortie}" />
            </h1>
            <div class="mt-4 flex flex-wrap gap-3">
                <a href="<c:url value='/sorties' />" class="rounded-xl border border-slate-300 bg-white px-4 py-2 font-medium text-slate-700 transition hover:bg-slate-50">← Retour aux sorties</a>
                <a href="<c:url value='/home' />" class="rounded-xl border border-slate-300 bg-white px-4 py-2 font-medium text-slate-700 transition hover:bg-slate-50">⌂ Retour à l'accueil</a>
            </div>
        </header>

        <section class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
            <p><strong>Nom :</strong> <c:out value="${sortie.nomSortie}" /></p>
            <p><strong>Description :</strong> <c:out value="${sortie.description}" /></p>
            <p><strong>Date :</strong> <c:out value="${sortie.dateSortie}" /></p>
            <p><strong>Catégorie :</strong> <c:out value="${sortie.categorie.categorieName}" /></p>

            <sec:authorize access="isAuthenticated()">
                <p>
                    <strong>Créateur :</strong>
                    <c:out value="${sortie.createur.prenom}" />
                    <c:out value=" " />
                    <c:out value="${sortie.createur.nom}" />
                </p>

                <p>
                    <strong>Site Web :</strong>
                    <c:if test="${not empty sortie.siteWeb}">
                        <a href="${sortie.siteWeb}" target="_blank" class="text-blue-600 underline hover:text-blue-700">Voir le site</a>
                    </c:if>

                    <c:if test="${empty sortie.siteWeb}">
                        <span class="text-slate-500">Non disponible</span>
                    </c:if>
                </p>

                <div class="mt-5 border-t border-slate-200 pt-4">
                    <c:if test="${estInscrit}">
                        <form action="<c:url value='/sorties/${sortie.sortieID}/quitter' />" method="post" class="inline-block">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="rounded-xl bg-rose-600 px-4 py-2 font-semibold text-white transition hover:bg-rose-700">
                                Quitter cette sortie
                            </button>
                        </form>
                    </c:if>

                    <c:if test="${not estInscrit}">
                        <form action="<c:url value='/sorties/${sortie.sortieID}/rejoindre' />" method="post" class="inline-block">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="submit" class="rounded-xl bg-emerald-600 px-4 py-2 font-semibold text-white transition hover:bg-emerald-700">
                                Rejoindre cette sortie
                            </button>
                        </form>
                    </c:if>
                </div>
            </sec:authorize>
        </section>
    </main>
</body>
</html>