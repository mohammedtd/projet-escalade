<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<form action="<c:url value='/reset-password' />" method="post">
    <input type="hidden" name="token" value="${token}" />
    <input type="password" name="nouveauMotDePasse" required />
    <button type="submit">Changer le mot de passe</button>
</form>
