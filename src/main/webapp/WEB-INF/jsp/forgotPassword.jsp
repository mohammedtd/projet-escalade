<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Réinitialiser le mot de passe</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-slate-100 text-slate-800">
    <main class="mx-auto flex min-h-screen max-w-2xl items-center px-4 py-10">
        <section class="w-full rounded-2xl border border-slate-200 bg-white p-6 shadow-sm md:p-8">
            <h1 class="mb-2 text-2xl font-extrabold text-slate-900">Réinitialiser le mot de passe</h1>
            <p class="mb-6 text-slate-600">Entre ton email pour recevoir un lien de réinitialisation.</p>

            <form action="<c:url value='/forgot-password' />" method="post" class="space-y-4">
                <div>
                    <label for="email" class="mb-2 block text-sm font-medium text-slate-700">Email</label>
                    <input id="email" type="email" name="email" required class="w-full rounded-xl border border-slate-300 bg-white px-3 py-2 text-slate-800 focus:border-blue-500 focus:outline-none" />
                </div>
                <button type="submit" class="inline-flex items-center justify-center rounded-xl bg-blue-600 px-6 py-3 font-semibold text-white transition hover:bg-blue-700">
                    Envoyer
                </button>
            </form>
        </section>
    </main>

    <c:if test="${not empty message}">
        <div id="confirmationPopup" class="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/50 px-4">
            <div class="w-full max-w-md rounded-2xl bg-white p-6 shadow-2xl">
                <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-emerald-100">
                    <svg class="h-8 w-8 text-emerald-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M22 7 13.03 12.7a2 2 0 0 1-2.06 0L2 7"/>
                        <rect x="2" y="5" width="20" height="14" rx="2"/>
                    </svg>
                </div>
                <h2 class="mt-4 text-center text-xl font-bold text-slate-900">Email envoyé</h2>
                <p class="mt-3 text-slate-600">
                    <c:out value="${message}" />
                </p>
                <div class="mt-6 flex justify-center">
                    <button
                        type="button"
                        onclick="document.getElementById('confirmationPopup').classList.add('hidden')"
                        class="rounded-xl bg-emerald-600 px-5 py-2 font-semibold text-white transition hover:bg-emerald-700">
                        Fermer
                    </button>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty erreur}">
        <div id="errorPopup" class="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/50 px-4">
            <div class="w-full max-w-md rounded-2xl bg-white p-6 shadow-2xl">
                <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-red-100">
                    <svg class="h-8 w-8 text-red-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <circle cx="12" cy="12" r="9"/>
                        <path d="M12 8v5"/>
                        <path d="M12 16h.01"/>
                    </svg>
                </div>
                <h2 class="mt-4 text-center text-xl font-bold text-red-700">Erreur</h2>
                <p class="mt-3 text-center text-slate-600">
                    <c:out value="${erreur}" />
                </p>
                <div class="mt-6 flex justify-center">
                    <button
                        type="button"
                        onclick="document.getElementById('errorPopup').classList.add('hidden')"
                        class="rounded-xl bg-red-600 px-5 py-2 font-semibold text-white transition hover:bg-red-700">
                        Fermer
                    </button>
                </div>
            </div>
        </div>
    </c:if>
</body>
</html>
