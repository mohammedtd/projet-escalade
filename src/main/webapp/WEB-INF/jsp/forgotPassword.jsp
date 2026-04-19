<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h1>Renitialiser le mots de passe</h1>
<form action="<c:url value='/forgot-password' />" method="post">
    <input type="email" name="email" required />
    <button type="submit">Envoyer</button>
</form>
