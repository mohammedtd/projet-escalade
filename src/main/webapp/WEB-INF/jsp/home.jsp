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
    <sec:authorize access="!isAuthenticated()">
      <li><a href="<c:url value='/categories' />">Voir les catégories</a></li>
      <li><a href="<c:url value='/sortie' />" > Voir les sorties</a></li>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
      <li><a href="<c:url value='/createur' />">voir les créateur et leurs sorties</a></li>
      <li><a href="<c:url value='/choix' />">gérer mes sorties</a></li>
      <form action="<c:url value='/logout' />" method="post">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <button type="submit">Logout</button>
      </form>
    </sec:authorize>


    <h2>Recherche de sorties</h2>
    <sec:authorize access="!isAuthenticated()">
          <form action="<c:url value='/sorties/search' />" method="get">
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

        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <form action="<c:url value='/sorties/search' />" method="get">
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

                  <div>
                       <label for="memberId">Créateur :</label>
                       <select id="memberId" name="memberId">
                           <option value="">-- Toutes les membres créateurs --</option>
                           <c:forEach var="membre" items="${membres}">
                               <option value="${membre.membreID}">
                                   <c:out value="${membre.membreName}" />
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

        </sec:authorize>


</body>
</html>