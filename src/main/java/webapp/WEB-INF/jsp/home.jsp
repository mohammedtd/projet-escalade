<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Club d'escalade</title>
</head>
<body>

    <h1>Bienvenue sur le catalogue des sorties du club d'escalade</h1>

    <p>
        Cette application permet de consulter les catégories et les sorties proposées par le club.
    </p>

    <h2>Navigation</h2>
    <ul>
        <li><a href="<c:url value='/categories' />">Voir les catégories</a></li>
        <li><a href="<c:url value='/login' />">Connexion membre</a></li>
    </ul>

    <h2>Recherche de sorties</h2>
    <form action="<c:url value='/sorties/recherche' />" method="get">
        <div>
            <label for="nom">Nom de la sortie :</label>
            <input type="text" id="nom" name="nom">
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

        <button type="submit">Rechercher</button>
    </form>

</body>
</html>