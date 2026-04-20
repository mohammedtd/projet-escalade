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
</body>
</html>
