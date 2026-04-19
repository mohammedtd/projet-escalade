<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Résultat de recherche</title>
</head>
<body>

    <h1>Résultat de la recherche</h1>

    <p>
        <a href="<c:url value='/home' />">Retour à l'accueil</a>
    </p>

    <!-- Si aucune sortie ne correspond -->
    <c:if test="${empty sorties}">
        <p>Aucune sortie ne correspond à ce critère.</p>
    </c:if>

    <!-- Si des sorties existent -->
    <c:if test="${not empty sorties}">
        <ul>
            <c:forEach var="sortie" items="${sorties}">
                <li>
                    <a href="<c:url value='/sorties/${sortie.sortieID}' />">
                        <c:out value="${sortie.nomSortie}" />
                    </a>

                    <br>

                    <strong>Date :</strong>
                    <c:out value="${sortie.dateSortie}" />

                    <br>

                    <strong>Catégorie :</strong>
                    <c:out value="${sortie.categorie.categorieName}" />

                    <br>

                    <sec:authorize access="isAuthenticated()">
                        <strong>Créateur :</strong>
                        <c:out value="${sortie.createur.prenom}" />
                        <c:out value=" " />
                        <c:out value="${sortie.createur.nom}" />
                        <br>
                    </sec:authorize>
                </li>

                <br>
            </c:forEach>
        </ul>
    </c:if>

</body>
</html>