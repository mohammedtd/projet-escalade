<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disciplines & Catégories — Club d'Escalade</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            fontFamily: {
              sans: ['"Plus Jakarta Sans"', 'sans-serif'],
            }
          }
        }
      }
    </script>
</head>
<body class="min-h-screen bg-zinc-950 text-zinc-100 antialiased pb-16">

    <!-- Top Border Line -->
    <div class="h-1.5 w-full bg-emerald-700"></div>

    <main class="mx-auto max-w-4xl px-6 py-12">
        
        <!-- Header -->
        <header class="mb-8 flex flex-col gap-4 rounded-xl border border-zinc-800 bg-zinc-900/30 p-6 shadow-md sm:flex-row sm:items-center sm:justify-between">
            <div>
                <h1 class="text-2xl font-extrabold text-white tracking-tight">Disciplines d'Escalade</h1>
                <p class="text-xs text-zinc-400 mt-1">Parcourez nos catégories d'activités en montagne et en salle</p>
            </div>
            <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-1.5 rounded-lg border border-zinc-800 bg-zinc-900/60 hover:bg-zinc-800 px-4 py-2.5 text-xs font-bold text-zinc-300 transition duration-150 shrink-0">
                ← Retour
            </a>
        </header>

        <c:if test="${empty categories}">
            <div class="rounded-xl border border-zinc-800 bg-zinc-900/30 p-12 text-center text-zinc-500 shadow-md">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-8 h-8 text-zinc-650 mx-auto mb-3">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
                </svg>
                Aucune catégorie n'est actuellement disponible.
            </div>
        </c:if>

        <c:if test="${not empty categories}">
            <ul class="grid gap-3 sm:grid-cols-2">
                <c:forEach var="categorie" items="${categories}">
                    <li>
                        <a href="<c:url value='/categories/${categorie.categorieID}' />"
                           class="group block rounded-lg border border-zinc-850 bg-zinc-900/10 p-4 shadow-sm transition duration-150 hover:border-emerald-700/50 hover:bg-zinc-900/50">
                            <div class="flex items-center justify-between gap-3">
                                <div class="flex items-center gap-3">
                                    <span class="h-1.5 w-1.5 rounded-full bg-emerald-600"></span>
                                    <span class="truncate text-sm font-bold text-zinc-200 group-hover:text-emerald-400 transition-colors">
                                        <c:out value="${categorie.categorieName}" />
                                    </span>
                                </div>
                                <span class="text-zinc-600 transition duration-150 group-hover:translate-x-0.5 group-hover:text-emerald-400">→</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </main>
</body>
</html>