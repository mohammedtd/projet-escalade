<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">

    <title>Liste des sorties</title>
</head>
<body>

    <h1>Liste de toutes les sorties</h1>

    <p>
        <a href="<c:url value='/home' />">Retour à l'accueil</a>
    </p>

    <c:if test="${empty sorties}">
        <p>Aucune sortie disponible.</p>
    </c:if>

    <c:if test="${not empty sorties}">
        <ul>

            <c:forEach var="sortie" items="${sorties}">
                <li>

                    <a href="<c:url value='/sorties/${sortie.sortieID}' />">
                        <c:out value="${sortie.nomSortie}" />
                    </a>

                    <br>

                </li>

                <br>
            </c:forEach>

        </ul>
    </c:if>

</body>
</html>