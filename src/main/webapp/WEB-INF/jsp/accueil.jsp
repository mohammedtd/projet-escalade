<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club d'Escalade — Accueil</title>
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
<body class="min-h-screen bg-zinc-950 text-zinc-100 antialiased flex flex-col justify-between">

    <!-- Top Border Line -->
    <div class="h-1.5 w-full bg-emerald-700"></div>

    <!-- Main Container -->
    <main class="mx-auto flex my-auto max-w-4xl items-center px-6 py-12">
        <section class="w-full rounded-2xl border border-zinc-800 bg-zinc-900/30 p-8 md:p-12 shadow-xl relative overflow-hidden">
            
            <div class="max-w-2xl">
                <span class="mb-4 inline-flex items-center gap-1.5 rounded bg-emerald-950/80 border border-emerald-800 px-3 py-1 text-xs font-semibold uppercase tracking-wider text-emerald-400">
                    Club d'escalade officiel
                </span>

                <h1 class="text-3xl font-extrabold leading-tight tracking-tight text-white md:text-5xl">
                    Préparez votre prochaine <span class="text-emerald-500">sortie</span>
                </h1>
                
                <p class="mt-4 text-sm text-zinc-400 md:text-base leading-relaxed">
                    Découvrez les voies, planifiez vos sorties alpines et rejoignez les membres actifs de notre club. Une plateforme technique et simple pour amateurs et grimpeurs confirmés.
                </p>

                <div class="mt-8 flex flex-col gap-3 sm:flex-row">
                    <a href="<c:url value='/login' />"
                       class="inline-flex items-center justify-center gap-2 rounded-lg bg-emerald-700 hover:bg-emerald-600 px-6 py-3 text-sm font-bold text-white transition-all duration-200">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-7.5a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 6 21h7.5a2.25 2.25 0 0 0 2.25-2.25V15m-3 0l3-3m0 0l-3-3m3 3H9" />
                        </svg>
                        Accéder à l'Espace Membre
                    </a>

                    <a href="<c:url value='/home' />"
                       class="inline-flex items-center justify-center gap-2 rounded-lg border border-zinc-800 bg-zinc-900/60 hover:bg-zinc-800 px-6 py-3 text-sm font-bold text-zinc-300 transition-all duration-200">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955a1.125 1.125 0 0 1 1.591 0L21.75 12M4.5 9.75V19.5A1.5 1.5 0 0 0 6 21h3.75v-6.75h4.5V21H18a1.5 1.5 0 0 0 1.5-1.5V9.75" />
                        </svg>
                        Visiter le Catalogue
                    </a>
                </div>
            </div>

            <!-- Stats Block -->
            <div class="mt-12 grid grid-cols-3 gap-4 border-t border-zinc-800/80 pt-8 text-left">
                <div>
                    <span class="block text-xl font-bold text-white md:text-2xl">10+</span>
                    <span class="block text-[10px] font-semibold text-zinc-500 uppercase tracking-wider">Disciplines</span>
                </div>
                <div class="border-l border-zinc-800/80 pl-4">
                    <span class="block text-xl font-bold text-white md:text-2xl">250+</span>
                    <span class="block text-[10px] font-semibold text-zinc-500 uppercase tracking-wider">Membres</span>
                </div>
                <div class="border-l border-zinc-800/80 pl-4">
                    <span class="block text-xl font-bold text-white md:text-2xl">4000+</span>
                    <span class="block text-[10px] font-semibold text-zinc-500 uppercase tracking-wider">Sorties</span>
                </div>
            </div>

        </section>
    </main>

    <!-- Footer -->
    <footer class="py-6 text-center text-xs text-zinc-600 border-t border-zinc-900">
        <p>© 2026 Club d'Escalade. Tous droits réservés.</p>
    </footer>

</body>
</html>