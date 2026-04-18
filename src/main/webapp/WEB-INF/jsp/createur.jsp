<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">

    <title>Créateurs et leurs sorties</title>
</head>
<body>
    <sec:authorize access="isAuthenticated()">

        <h1>Liste des créateurs et leurs sorties</h1>
        <p>
            <a href="<c:url value='/home' />">Retour à l'accueil</a>
        </p>

        <c:if test="${empty membres}">
            <p>Aucun créateur disponible.</p>
        </c:if>

        <c:if test="${not empty membres}">

            <c:forEach var="membre" items="${membres}">

                <c:if test="${not empty membre.sorties}">

                    <!-- Nom du créateur -->
                    <h2>
                        <c:out value="${membre.prenom}" />
                        <c:out value=" " />
                        <c:out value="${membre.nom}" />
                    </h2>
                    <ul>

                        <!-- Boucle sur les sorties du membre -->
                        <c:forEach var="sortie" items="${membre.sorties}">

                            <li>
                                <a href="<c:url value='/sorties/${sortie.sortieID}' />">
                                    <c:out value="${sortie.nomSortie}" />
                                </a>

                            </li>

                            <br>

                        </c:forEach>

                    </ul>

                </c:if>

            </c:forEach>

        </c:if>

    </sec:authorize>

</body>
</html>