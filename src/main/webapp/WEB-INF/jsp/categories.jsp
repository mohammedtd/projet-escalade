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
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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
<body class="min-h-screen bg-[#090d16] bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-slate-900 via-[#090d16] to-[#04060b] text-slate-200 antialiased relative pb-16">

    <!-- Back ornaments -->
    <div class="absolute top-0 right-1/4 -z-10 h-[300px] w-[40%] rounded-full bg-emerald-500/5 blur-[120px]"></div>

    <main class="mx-auto max-w-4xl px-4 py-8 md:px-6 md:py-12">
        
        <!-- Header -->
        <header class="mb-8 flex flex-col gap-4 rounded-3xl border border-slate-800 bg-slate-900/40 p-6 backdrop-blur-xl shadow-2xl sm:flex-row sm:items-center sm:justify-between">
            <div>
                <h1 class="text-2xl font-extrabold text-white md:text-3xl">Disciplines d'Escalade</h1>
                <p class="text-xs text-slate-400 mt-1">Parcourez nos catégories d'activités en montagne et en salle</p>
            </div>
            <a href="<c:url value='/home' />" class="inline-flex items-center justify-center gap-2 rounded-2xl border border-slate-700 bg-slate-800/40 px-5 py-2.5 font-bold text-slate-300 transition hover:bg-slate-800 hover:text-white hover:border-slate-600 backdrop-blur-sm shrink-0">
                ← Retour
            </a>
        </header>

        <c:if test="${empty categories}">
            <div class="rounded-3xl border border-slate-800 bg-slate-900/40 p-12 text-center text-slate-400 backdrop-blur-xl shadow-2xl">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-12 h-12 text-slate-600 mx-auto mb-4">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" />
                </svg>
                Aucune catégorie n'est actuellement disponible.
            </div>
        </c:if>

        <c:if test="${not empty categories}">
            <ul class="grid gap-4 sm:grid-cols-2">
                <c:forEach var="categorie" items="${categories}">
                    <li>
                        <a href="<c:url value='/categories/${categorie.categorieID}' />"
                           class="group block rounded-2xl border border-slate-800/60 bg-slate-900/30 p-5 shadow-lg transition-all duration-300 hover:border-emerald-500/30 hover:bg-slate-900/60 hover:scale-[1.01]">
                            <div class="flex items-center justify-between gap-3">
                                <div class="flex items-center gap-3">
                                    <!-- Dynamic generic climbing symbol or bullet -->
                                    <span class="h-2 w-2 rounded-full bg-emerald-400 shadow-[0_0_10px_rgba(52,211,153,0.5)]"></span>
                                    <span class="truncate text-base font-bold text-white group-hover:text-emerald-400 transition-colors">
                                        <c:out value="${categorie.categorieName}" />
                                    </span>
                                </div>
                                <span class="text-slate-600 transition duration-300 group-hover:translate-x-1 group-hover:text-emerald-400">→</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </main>
</body>
</html>