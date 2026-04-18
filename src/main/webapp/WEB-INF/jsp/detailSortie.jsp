<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Tag Spring Security pour gérer connecté / non connecté -->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détail de la sortie</title>
</head>
<body>
    <h1>
        Détail de la sortie :
        <c:out value="${sortie.nomSortie}" />
    </h1>
    <p>
        <a href="<c:url value='/sorties' />">Retour aux sorties</a>
    </p>

    <p>
        <a href="<c:url value='/home' />">Retour à l'accueil</a>
    </p>
    <p>
        <strong>Nom :</strong>
        <c:out value="${sortie.nomSortie}" />
    </p>
    <p>
        <strong>Description :</strong>
        <c:out value="${sortie.description}" />
    </p>
    <p>
        <strong>Date :</strong>
        <c:out value="${sortie.dateSortie}" />
    </p>
    <p>
        <strong>Catégorie :</strong>
        <c:out value="${sortie.categorie.categorieName}" />
    </p>
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
                <a href="${sortie.siteWeb}" target="_blank">
                    Voir le site
                </a>
            </c:if>

            <c:if test="${empty sortie.siteWeb}">
                <span>Non disponible</span>
            </c:if>

        </p>

    </sec:authorize>


</body>
</html>