<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Club d'escalade</title>
</head>
<body>

    <h1>Bienvenue sur le catalogue des sorties du club d'escalade</h1>


    <h2>Navigation</h2>
        <ul>
            <li>
                <a href="<c:url value='/categories' />">Voir les catégories</a>
            </li>
            <li>
                <a href="<c:url value='/sorties' />">Voir les sorties</a>
            </li>
            <sec:authorize access="isAuthenticated()">
                <li>
                    <a href="<c:url value='/createur' />">Voir les créateurs et leurs sorties</a>
                </li>
                <li>
                    <a href="<c:url value='/choix' />">Gérer mes sorties</a>
                </li>
                <li>
                    <form action="<c:url value='/logout' />" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit">Se déconnecter</button>
                    </form>
                </li>

            </sec:authorize>

        </ul>

    <h2>Recherche de sorties</h2>

        <a href="/categories">
                <div>
                <label for="nom">Nom de la sortie :</label>
                <select id="nom" name="nom">
                    <option value="">-- Toutes les sorties --</option>
                    <c:forEach var="sortie" items="${sorties}">
                        <option value="${sortie.nomSortie}">
                            <c:out value="${sortie.nomSortie}" />
                        </option>
                    </c:forEach>
                </select>
            </div>

            <br>
                <div>
                <label for="categorieId">Catégorie :</label>
                <select id="categorieId" name="categorieId">
                    <option value="">-- Toutes les catégories --</option>
                    <c:forEach var="categorie" items="${categories}">
                        <option value="${categorie.categorieID}">
                            <c:out value="${categorie.categorieName}" />
                        </option>
                    </c:forEach>
                </select>
            </div>

            <br>

            <div>
                <label for="dateSortie">Date de sortie :</label>
                <input type="date" id="dateSortie" name="dateSortie">
            </div>

            <br>

            <sec:authorize access="isAuthenticated()">
                <div>
                    <label for="createurId">Créateur :</label>
                    <select id="createurId" name="createurId">
                        <option value="">-- Tous les créateurs --</option>
                        <c:forEach var="membre" items="${membres}">
                            <option value="${membre.membreID}">
                                <c:out value="${membre.prenom}" />
                                <c:out value=" " />
                                <c:out value="${membre.nom}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <br>
            </sec:authorize>

            <button type="submit">Rechercher</button>
        </form>>


</body>
</html>