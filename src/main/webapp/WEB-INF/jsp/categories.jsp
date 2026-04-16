<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Catégories</title>
</head>
<body>

    <h1>Liste des catégories</h1>

    <p>
        <a href="<c:url value='/' />">Retour à l'accueil</a>
    </p>

    <c:if test="${empty categories}">
        <p>Aucune catégorie disponible.</p>
    </c:if>

    <c:if test="${not empty categories}">
        <ul>
            <c:forEach var="categorie" items="${categories}">
                <li>
                    <a href="<c:url value='/categories/${categorie.categorieID}' />">
                        <c:out value="${categorie.categorieName}" />
                    </a>
                </li>
            </c:forEach>
        </ul>
    </c:if>

</body>
</html>