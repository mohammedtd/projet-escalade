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
<body class="min-h-screen bg-[#090d16] bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-slate-900 via-[#090d16] to-[#04060b] text-slate-200 antialiased flex items-center justify-center p-4 relative overflow-hidden">

    <!-- Top Glow Ornaments -->
    <div class="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 -z-10 h-[300px] w-[300px] rounded-full bg-emerald-500/10 blur-[100px]"></div>

    <main class="w-full max-w-md rounded-3xl border border-slate-800 bg-slate-900/40 p-8 backdrop-blur-xl shadow-2xl relative">
        <section class="w-full">
            <div class="mb-6">
                <h1 class="text-3xl font-extrabold text-white">Nouveau mot de passe</h1>
                <p class="text-sm text-slate-400 mt-2">Saisis ton nouveau mot de passe pour finaliser la réinitialisation.</p>
            </div>

            <form action="<c:url value='/reset-password' />" method="post" class="space-y-5">
                <input type="hidden" name="token" value="${token}" />
                <div>
                    <label for="nouveauMotDePasse" class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">Nouveau mot de passe</label>
                    <input id="nouveauMotDePasse" type="password" name="nouveauMotDePasse" required placeholder="••••••••" class="w-full rounded-2xl border border-slate-800 bg-slate-950/80 px-4 py-3.5 text-white placeholder-slate-600 focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500 focus:outline-none transition-all" />
                </div>
                <button type="submit" class="w-full rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-600 py-3.5 font-bold text-white transition-all duration-300 hover:from-emerald-400 hover:to-teal-500 hover:scale-[1.01] active:scale-[0.99] shadow-lg shadow-emerald-950/40">
                    Changer le mot de passe
                </button>
            </form>
        </section>
    </main>
</body>
</html>
