<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Sorties de la catégorie</title>
</head>
<body>

    <h1>Sorties de la catégorie : <c:out value="${categorie.categorieName}" /></h1>

    <p>
        <a href="<c:url value='/' />">Accueil</a> |
        <a href="<c:url value='/categories' />">Retour aux catégories</a>
    </p>

    <c:if test="${empty sorties}">
        <p>Aucune sortie disponible pour cette catégorie.</p>
    </c:if>

    <c:if test="${not empty sorties}">
        <ul>
            <c:forEach var="sortie" items="${sorties}">
                <li>
                    <a href="<c:url value='/sorties/${sortie.sortieID}' />">
                        <c:out value="${sortie.nomSortie}" />
                    </a>
                    -
                    <c:out value="${sortie.dateSortie}" />
                </li>
            </c:forEach>
        </ul>
    </c:if>

</body>
</html>