<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club d'Escalade — Sommets & Aventures</title>
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
    <style>
      .glow-shadow {
        box-shadow: 0 0 40px -10px rgba(16, 185, 129, 0.2);
      }
    </style>
</head>
<body class="min-h-screen bg-[#090d16] bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-slate-900 via-[#090d16] to-[#04060b] text-slate-200 antialiased flex flex-col justify-between">

    <!-- Top Glow Ornament -->
    <div class="absolute top-0 left-1/4 -z-10 h-[350px] w-[50%] rounded-full bg-emerald-500/10 blur-[120px]"></div>
    <div class="absolute top-0 right-1/4 -z-10 h-[300px] w-[40%] rounded-full bg-indigo-500/10 blur-[100px]"></div>

    <!-- Main Container -->
    <main class="mx-auto flex my-auto max-w-5xl items-center px-4 py-16 md:px-8">
        <section class="w-full rounded-3xl border border-slate-800/80 bg-slate-900/40 p-8 md:p-16 backdrop-blur-xl shadow-2xl relative overflow-hidden glow-shadow">
            
            <!-- Absolute decorative shapes -->
            <div class="absolute -right-16 -top-16 w-32 h-32 bg-emerald-500/5 rounded-full blur-2xl"></div>
            <div class="absolute -left-16 -bottom-16 w-32 h-32 bg-indigo-500/5 rounded-full blur-2xl"></div>

            <div class="max-w-3xl mx-auto text-center">
                <span class="mb-5 inline-flex items-center gap-1.5 rounded-full border border-emerald-500/30 bg-emerald-500/10 px-4 py-1.5 text-xs font-semibold uppercase tracking-widest text-emerald-400">
                    <span class="h-1.5 w-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
                    Club d'escalade
                </span>

                <h1 class="text-4xl font-extrabold leading-tight tracking-tight text-white md:text-6xl">
                    Conquiers les <span class="bg-gradient-to-r from-emerald-400 via-teal-300 to-indigo-400 bg-clip-text text-transparent">Sommets</span>
                </h1>
                
                <p class="mt-6 text-base text-slate-400 md:text-lg leading-relaxed max-w-2xl mx-auto">
                    Explore les plus belles sorties, découvre de nouvelles catégories et gère ton activité alpine au sein d'une communauté de passionnés.
                </p>

                <div class="mt-10 flex flex-col justify-center gap-4 sm:flex-row">
                    <a href="<c:url value='/login' />"
                       class="inline-flex items-center justify-center gap-2 rounded-2xl bg-gradient-to-r from-emerald-500 to-teal-600 px-8 py-4 font-bold text-white transition-all duration-300 hover:from-emerald-400 hover:to-teal-500 hover:scale-[1.02] active:scale-[0.98] shadow-lg shadow-emerald-950/40">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="h-5 w-5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-7.5a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 006 21h7.5a2.25 2.25 0 002.25-2.25V15m-3 0l3-3m0 0l-3-3m3 3H9" />
                        </svg>
                        Espace Membre
                    </a>

                    <a href="<c:url value='/home' />"
                       class="inline-flex items-center justify-center gap-2 rounded-2xl border border-slate-700 bg-slate-800/40 px-8 py-4 font-bold text-slate-300 transition-all duration-300 hover:bg-slate-800 hover:text-white hover:border-slate-600 hover:scale-[1.02] active:scale-[0.98] backdrop-blur-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="h-5 w-5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955a1.125 1.125 0 011.591 0L21.75 12M4.5 9.75V19.5A1.5 1.5 0 006 21h3.75v-6.75h4.5V21H18a1.5 1.5 0 001.5-1.5V9.75" />
                        </svg>
                        Découvrir le club
                    </a>
                </div>
            </div>

            <!-- Features Quick Info -->
            <div class="mt-16 grid grid-cols-3 gap-4 border-t border-slate-800/80 pt-10 text-center">
                <div>
                    <span class="block text-2xl font-extrabold text-white md:text-3xl">10+</span>
                    <span class="mt-1 block text-xs font-semibold text-slate-500 uppercase tracking-wider">Disciplines</span>
                </div>
                <div class="border-x border-slate-800/80">
                    <span class="block text-2xl font-extrabold text-white md:text-3xl">200+</span>
                    <span class="mt-1 block text-xs font-semibold text-slate-500 uppercase tracking-wider">Membres</span>
                </div>
                <div>
                    <span class="block text-2xl font-extrabold text-white md:text-3xl">4000+</span>
                    <span class="mt-1 block text-xs font-semibold text-slate-500 uppercase tracking-wider">Sorties</span>
                </div>
            </div>

        </section>
    </main>

    <!-- Footer -->
    <footer class="py-8 text-center text-xs text-slate-600 border-t border-slate-900/50">
        <p>© 2026 Club d'Escalade. Tous droits réservés.</p>
    </footer>

</body>
</html>