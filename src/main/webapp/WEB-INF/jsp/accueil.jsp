<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800">
    <main class="mx-auto flex min-h-screen max-w-4xl items-center px-6 py-12">
        <section class="w-full rounded-2xl border border-slate-200 bg-white p-8 shadow-sm md:p-12">
            <p class="mb-4 inline-flex items-center rounded-full border border-blue-200 bg-blue-50 px-4 py-1 text-xs font-semibold uppercase tracking-widest text-blue-700">
                Club d'escalade
            </p>

            <h1 class="text-3xl font-extrabold leading-tight text-slate-900 md:text-5xl">
                Gestion d'un club d'escalade
            </h1>
            <p class="mt-4 max-w-2xl text-slate-600">
                Explore les sorties, découvre les catégories et gère ton activité avec une interface moderne et agréable.
            </p>

            <div class="mt-8 flex flex-col gap-4 sm:flex-row">
                <a href="<c:url value='/login' />"
                   class="inline-flex items-center justify-center gap-2 rounded-xl bg-blue-600 px-5 py-3 font-semibold text-white transition hover:bg-blue-700">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-5 w-5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-7.5a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 006 21h7.5a2.25 2.25 0 002.25-2.25V15m-3 0l3-3m0 0l-3-3m3 3H9" />
                    </svg>
                    Se connecter
                </a>

                <a href="<c:url value='/home' />"
                         class="inline-flex items-center justify-center gap-2 rounded-xl border border-slate-300 bg-white px-5 py-3 font-semibold text-slate-700 transition hover:bg-slate-50">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-5 w-5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955a1.125 1.125 0 011.591 0L21.75 12M4.5 9.75V19.5A1.5 1.5 0 006 21h3.75v-6.75h4.5V21H18a1.5 1.5 0 001.5-1.5V9.75" />
                    </svg>
                    Visiter
                </a>
            </div>
        </section>
    </main>
</body>
</html>