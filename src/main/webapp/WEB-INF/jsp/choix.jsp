<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gérer mes sorties</title>
</head>
<body>
    <h1>Gestion de mes sorties</h1>
    <p>
        Bonjour
        <strong>
            <c:out value="${membre.prenom}" />
            <c:out value=" " />
            <c:out value="${membre.nom}" />
        </strong>
    </p>
    <p>
        <a href="<c:url value='/home' />">Retour à l'accueil</a>
    </p>

    <p>
        <a href="<c:url value='/choix/ajouter' />">Créer une nouvelle sortie</a>
    </p>

    <c:if test="${empty sorties}">
        <p>Vous n'avez encore créé aucune sortie.</p>
    </c:if>
    <c:if test="${not empty sorties}">
        <h2>Mes sorties</h2>
        <ul>
            <c:forEach var="sortie" items="${sorties}">

                <li>
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

                    <p>
                        <a href="<c:url value='/choix/modifier/${sortie.sortieID}' />">
                            Modifier
                        </a>
                    </p>

                    <form action="<c:url value='/choix/supprimer/${sortie.sortieID}' />" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit">Supprimer</button>
                    </form>
                    <hr>

                </li>

            </c:forEach>

        </ul>

    </c:if>

</body>
</html>