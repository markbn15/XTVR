## 🚀 Xuper TV Reborn+

<p align="center">
  <img width="912" height="912" alt="icon" src="https://github.com/user-attachments/assets/34c645fb-cf06-4a9a-b969-7acf3409ef86" />
</p>

Xuper TV Reborn+ es una aplicación de código abierto de alto rendimiento desarrollada en Kotlin y optimizada tanto para Android TV (con navegación adaptada para control remoto mediante Leanback) como para dispositivos móviles. Funciona como una interfaz avanzada y unificada para la reproducción y agregación de contenido multimedia proveniente de múltiples proveedores externos.
✨ Características Principales
•
📺 Interfaz Dual Adaptativa (TV y Móvil): Diseñada específicamente para ofrecer una experiencia de usuario fluida y limpia tanto en pantallas grandes con D-pad como en smartphones táctiles.
•
🔌 Proveedores Múltiples: Agrega contenido (películas, series, anime y televisión en vivo/deportes) de diversos proveedores externos de streaming.
•
🎬 Integración con TMDB: Sincronización de metadatos detallados, carátulas, sinopsis, valoraciones y reparto gracias a la API de TMDB.
•
☁️ Sincronización en la Nube (Supabase): Permite iniciar sesión y sincronizar automáticamente el historial de reproducción, favoritos y datos de usuario entre diferentes dispositivos.
•
🛡️ Control Parental: Sistema de protección mediante PIN numérico y restricciones de edad configurables.
•
⚙️ Ajustes Avanzados de Reproducción: Control de búfer, gestos en pantalla (en móvil), subtítulos automáticos y soporte para reproductores externos.
•
🌐 Herramientas de Red: Configuración de DNS sobre HTTPS (DoH) y escáner QR para la importación rápida de configuraciones o enlaces de bypass.
•
🔄 Actualizador Integrado y Optimización de Arquitectura:
◦
Comprobación automática de actualizaciones mediante GitHub Releases.
◦
Compilación optimizada con ABI Splits (armeabi-v7a, arm64-v8a, x86, x86_64) para reducir el tamaño de instalación y garantizar la máxima compatibilidad con cualquier TV Box o teléfono.
🛠️ Tecnologías y Stack
•
Lenguaje: Kotlin (Coroutines, Flow)
•
UI: Android Leanback, ViewBinding, Material Design
•
Red: Retrofit 2, OkHttp, DNS over HTTPS (DoH), Jsoup
•
Base de Datos & Almacenamiento: Room DB, SharedPreferences
•
Multimedia: ExoPlayer / Media3
•
Backend / Sincronización: Supabase (Auth, Postgrest, Realtime)
