<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Sorties de la catégorie</title>
</head>
<body>

    <h1>
        Sorties de la catégorie :
        <c:out value="${categorie.categorieName}" />
    </h1>

    <p>
        <a href="<c:url value='/categories' />">Retour aux catégories</a>
    </p>
    <p>
        <a href="<c:url value='/home' />">Retour à l'accueil</a>
    </p>

    <c:if test="${empty sorties}">
        <p>Aucune sortie trouvée pour cette catégorie.</p>
    </c:if>

    <c:if test="${not empty sorties}">
        <ul>

            <c:forEach var="sortie" items="${sorties}">
                <li>

                    <a href="<c:url value='/sorties/${sortie.sortieID}' />">
                        <c:out value="${sortie.nomSortie}" />
                    </a>
                </li>
            </c:forEach>

        </ul>
    </c:if>

</body>
</html>