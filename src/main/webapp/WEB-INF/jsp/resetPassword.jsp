<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouveau mot de passe — Club d'Escalade</title>
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
<body class="min-h-screen bg-zinc-950 text-zinc-100 antialiased flex items-center justify-center p-4">

    <main class="w-full max-w-md rounded-xl border border-zinc-800 bg-zinc-900/30 p-8 shadow-lg">
        <section class="w-full">
            <div class="mb-6">
                <h1 class="text-2xl font-extrabold text-white tracking-tight">Nouveau mot de passe</h1>
                <p class="text-xs text-zinc-400 mt-1">Saisissez votre nouveau mot de passe pour finaliser.</p>
            </div>

            <form action="<c:url value='/reset-password' />" method="post" class="space-y-4">
                <input type="hidden" name="token" value="${token}" />
                <div>
                    <label for="nouveauMotDePasse" class="block text-xs font-bold uppercase tracking-wider text-zinc-400 mb-1.5">Nouveau mot de passe</label>
                    <input id="nouveauMotDePasse" type="password" name="nouveauMotDePasse" required placeholder="••••••••" class="w-full rounded-lg border border-zinc-800 bg-zinc-950 px-3.5 py-2.5 text-sm text-white placeholder-zinc-700 focus:border-emerald-700 focus:outline-none transition-all" />
                </div>
                <button type="submit" class="w-full rounded-lg bg-emerald-700 hover:bg-emerald-600 py-3 text-sm font-bold text-white transition-all duration-200 shadow-sm mt-2">
                    Enregistrer le mot de passe
                </button>
            </form>
        </section>
    </main>
</body>
</html>