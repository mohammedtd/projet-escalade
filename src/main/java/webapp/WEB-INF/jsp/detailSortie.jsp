<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détail de la sortie</title>
</head>
<body>

    <h1>Détail de la sortie</h1>

    <p>
        <a href="<c:url value='/' />">Accueil</a> |
        <a href="<c:url value='/categories' />">Catégories</a>
    </p>

    <p><strong>Nom :</strong> <c:out value="${sortie.nomSortie}" /></p>
    <p><strong>Description :</strong> <c:out value="${sortie.description}" /></p>
    <p><strong>Date :</strong> <c:out value="${sortie.dateSortie}" /></p>
    <p><strong>Catégorie :</strong> <c:out value="${sortie.categorie.categorieName}" /></p>

    <!-- Pour le visiteur, on n'affiche pas le site web ni le créateur -->

</body>
</html>