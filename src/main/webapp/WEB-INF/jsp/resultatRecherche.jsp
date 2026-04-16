<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Résultats de recherche</title>
</head>
<body>

    <h1>Résultats de la recherche</h1>

    <p>
        <a href="<c:url value='/' />">Retour à l'accueil</a>
    </p>

    <h2>Critères saisis</h2>

    <p>
        <strong>Nom :</strong>
        <c:choose>
            <c:when test="${not empty nom}">
                <c:out value="${nom}" />
            </c:when>
            <c:otherwise>
                Non renseigné
            </c:otherwise>
        </c:choose>
    </p>

    <p>
        <strong>Catégorie :</strong>
        <c:choose>
            <c:when test="${not empty categorieId}">
                <c:out value="${categorieId}" />
            </c:when>
            <c:otherwise>
                Toutes les catégories
            </c:otherwise>
        </c:choose>
    </p>

    <p>
        <strong>Date :</strong>
        <c:choose>
            <c:when test="${not empty dateSortie}">
                <c:out value="${dateSortie}" />
            </c:when>
            <c:otherwise>
                Non renseignée
            </c:otherwise>
        </c:choose>
    </p>

    <hr>

    <c:if test="${empty sorties}">
        <p>Aucune sortie ne correspond à votre recherche.</p>
    </c:if>

    <c:if test="${not empty sorties}">
        <p>
            <strong><c:out value="${sorties.size()}" /></strong> sortie(s) trouvée(s).
        </p>

        <ul>
            <c:forEach var="sortie" items="${sorties}">
                <li>
                    <a href="<c:url value='/sorties/${sortie.sortieID}' />">
                        <c:out value="${sortie.nomSortie}" />
                    </a>
                    -
                    <c:out value="${sortie.dateSortie}" />
                    -
                    <c:out value="${sortie.categorie.categorieName}" />
                </li>
            </c:forEach>
        </ul>
    </c:if>

</body>
</html>