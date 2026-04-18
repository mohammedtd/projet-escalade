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

                    <br>

                    <strong>Description :</strong>
                    <c:out value="${sortie.description}" />

                    <br>

                    <strong>Date :</strong>
                    <c:out value="${sortie.dateSortie}" />

                    <br>

                    <sec:authorize access="isAuthenticated()">

                        <strong>Créateur :</strong>
                        <c:out value="${sortie.createur.prenom}" />
                        <c:out value=" " />
                        <c:out value="${sortie.createur.nom}" />

                        <br>

                        <strong>Site Web :</strong>

                        <c:if test="${not empty sortie.siteWeb}">
                            <a href="${sortie.siteWeb}" target="_blank">
                                Voir le site
                            </a>
                        </c:if>

                        <c:if test="${empty sortie.siteWeb}">
                            <span>Non disponible</span>
                        </c:if>

                        <br>

                    </sec:authorize>

                </li>

                <br>
            </c:forEach>

        </ul>
    </c:if>

</body>
</html>