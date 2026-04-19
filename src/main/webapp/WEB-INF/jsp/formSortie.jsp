<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h1>Formulaire sortie</h1>

<form method="post">

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

    Nom :
    <input type="text" name="nomSortie" value="${sortie.nomSortie}" required />
    <br>

    Description :
    <input type="text" name="description" value="${sortie.description}" required/>
    <br>

    Site Web :
    <input type="text" name="siteWeb" value="${sortie.siteWeb}"/>
    <br>

    Date :
    <input type="date" name="dateSortie" value="${sortie.dateSortie}" required/>
    <br>

    Catégorie :
    <select name="categorieId">
        <c:forEach var="cat" items="${categories}">
            <option value="${cat.categorieID}">
                ${cat.categorieName}
            </option>
        </c:forEach>
    </select>

    <br><br>

    <button type="submit">Valider</button>

</form>