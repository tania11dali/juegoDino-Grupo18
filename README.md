# Juego Dino

Juego inspirado en el dinosaurio de Google Chrome, implementado en **Pharo/Smalltalk** con
Programación Orientada a Objetos. Trabajo Práctico Integrador (5.ª instancia de evaluación,
escenario 8 «Dino») de **Paradigmas de Programación**.

> UTN – Facultad Regional Resistencia · Ingeniería en Sistemas de Información
> Grupo 18 · Comisión 2.2 · 2026

> **Repositorio:** https://github.com/tania11dali/juegoDino-Grupo18 (rama `main`)

El Dino corre automáticamente. El jugador salta o se agacha para esquivar obstáculos y puede
recolectar monedas. La partida termina con la primera colisión, muestra el puntaje y permite
empezar otra.

## Vista previa del juego

## Integrantes

- Antoniazzi, Ariadna Abril
- Dali, Tania Yazmín
- Pelozo, Luis Adolfo
- Retamozo, Santiago
- Velazquez, Lourdes Beatriz

## Requisitos

- **Pharo 14**, la versión con la que se desarrolló y probó el proyecto
  (descarga en https://pharo.org/download).
- **Git**. Iceberg, que viene incluido en Pharo, se encarga de bajar el código.
- No hay dependencias externas: el proyecto usa solo clases del núcleo de Pharo
  (`Morph`, `StringMorph`, `Random`, `Color`, `Rectangle`, `KeyboardKey`).
- Se necesita internet únicamente para descargar y clonar el repositorio.

## Cómo cargar el proyecto

Smalltalk no se compila: el código se carga en una imagen de Pharo. El repositorio está en
formato Tonel (`src/JuegoDino/`).

1. Abrir una imagen de Pharo 14 (por ejemplo, desde Pharo Launcher).
2. Abrir el navegador de repositorios Git desde el menú **Browse → Git Repositories Browser**.
3. Tocar **+ Add** y elegir **Clone from github.com**.
4. Completar *Owner Name* = `tania11dali`, *Project Name* = `juegoDino-Grupo18`, *Local Directory* = carpeta en donde se va a guardará el repositorio,  *Protocol* = `HTTPS` y tocar **OK**.
5. Completar *Username* = `tu nombre de usuario de GitHub` y *Password* = `tu Personal Access Token (PAT) de GitHub`, con permisos de lectura sobre el repositorio.
6. En Repositories, abrir el repositorio `juegoDino-Grupo18`, sobre `JuegoDino` hacer clic derecho, elegir **+ Load**.
7. Esperar a que termine la carga. Para verificarla, abrir el *System Browser*
   (*Browse → System Browser*): tiene que aparecer el package `JuegoDino` con **19 clases**.
   
## Cómo ejecutar

Abrir un **Playground** (*Browse → Playground*), escribir lo siguiente y ejecutarlo con
*Do it* (`Ctrl+D`):

```smalltalk
AplicacionDino new iniciar
```

Se abre la ventana del juego (800 × 350). Hacer clic dentro de la ventana para darle el foco
del teclado y presionar **ESPACIO** para empezar.

## Controles

| Tecla | Efecto |
|---|---|
| **ESPACIO** | Empieza la partida; salta durante la partida; reinicia luego del Game Over |
| **Flecha abajo** (mantener) | El Dino se agacha |
| Soltar la flecha abajo | El Dino se levanta |

## Reglas del juego

- Cada **obstáculo esquivado** suma **1 punto** y se cuenta una sola vez.
- Cada **moneda recolectada** suma **5 puntos**. Las monedas no afectan la dificultad.
- La **dificultad** aumenta cada 5 obstáculos superados: sube la velocidad (de 6 a un máximo
  de 18) y se reduce la distancia entre obstáculos (de 400 a un mínimo de 250).
- **Chocar con un obstáculo termina la partida.** Se muestra «GAME OVER» y se puede empezar
  otra con ESPACIO.
- La pantalla muestra el **puntaje** de la partida y el **récord** de la sesión, que se
  conserva entre partidas mientras la aplicación sigue abierta.
- Hay dos tipos de obstáculo. El **terrestre** (cactus) se esquiva saltando: agacharse no
  alcanza. El **aéreo** pasa por encima del Dino agachado y choca con el Dino erguido.
- El generador no produce más de dos obstáculos seguidos del mismo tipo.

### Aporte original: monedas coleccionables

Aparecen monedas a poca altura del suelo, que se recolectan al saltar. Una moneda no aparece
pegada a un obstáculo (margen de 60 píxeles). Una moneda no recolectada no suma puntos.

## Estructura del código

El código está en `src/JuegoDino/`. El dominio no depende de Morphic: las vistas solo
consultan al dominio y las órdenes del jugador entran únicamente a través de `Partida`.

| Grupo | Clases |
|---|---|
| Partida y personaje | `Partida`, `Dino`, `EstadoDino`, `EstadoCorriendo`, `EstadoSaltando`, `EstadoAgachado` |
| Escenario | `Escenario`, `ElementoDelEscenario`, `Obstaculo`, `ObstaculoTerrestre`, `ObstaculoAereo`, `Moneda`, `Dificultad` |
| Generación | `GeneradorDeObstaculos`, `GeneradorDeMonedas` |
| Interfaz gráfica (Morphic) | `JuegoMorph`, `DinoMorph`, `EscenarioMorph` |
| Aplicación | `AplicacionDino` (punto de entrada, crea cada `Partida` y guarda el récord) |

### Conceptos de POO aplicados

- **Herencia:** `ElementoDelEscenario` → `Obstaculo` → `ObstaculoTerrestre` / `ObstaculoAereo`,
  y `ElementoDelEscenario` → `Moneda`. `EstadoDino` → `EstadoCorriendo` / `EstadoSaltando` /
  `EstadoAgachado`.
- **Polimorfismo:** `Dino` envía los mismos mensajes a su estado y cada estado responde a su
  manera. `Escenario` trata obstáculos y monedas con mensajes comunes (`avanzar:`, `area`).
- **Abstracción:** `EstadoDino`, `ElementoDelEscenario` y `Obstaculo` son clases abstractas
  (`subclassResponsibility`; `Obstaculo class >> isAbstract`).
- **Encapsulamiento:** `Escenario` devuelve copias de sus colecciones; el puntaje solo se
  modifica desde `Partida`; los valores de configuración son métodos de clase constantes.

## Pruebas manuales

Se probó ejecutando el juego en Pharo 14. Casos para la demostración:

| Caso | Acción | Resultado esperado |
|---|---|---|
| Inicio | `AplicacionDino new iniciar` | Ventana con el mensaje «Presioná ESPACIO para jugar», puntaje 0 y récord 0 |
| Salto | ESPACIO durante la partida | El Dino salta, supera un cactus y aterriza |
| Agacharse | Mantener flecha abajo ante un obstáculo aéreo | El Dino pasa por debajo sin chocar |
| Moneda | Saltar sobre una moneda | La moneda desaparece y el puntaje sube 5 puntos |
| Obstáculo esquivado | Superar un obstáculo | El puntaje sube 1 punto |
| Colisión | Chocar con un obstáculo | La partida se detiene y aparece «GAME OVER» |
| Reinicio | ESPACIO tras perder | Nueva partida con puntaje 0 y el récord conservado |
| Acción inválida | Saltar de nuevo en el aire, agacharse en el aire o saltar estando agachado | La acción se ignora y el juego continúa sin errores |

## Documentación

- **Informe técnico Paper (PDF):** análisis, modelo de objetos, implementación y resultados. Con la finalidad de registrar la experiencia de la creación del juego dino.
- **Diagrama de clases:** https://drive.google.com/file/d/1UBV4kj0_EiHvUzpnRLOfmq9V2ztVdQ3Q/view?usp=sharing
- **Diapositiva (PDF):** utilizada por el equipo durante la exposición.


## Sin conexión a internet

Una vez cargado el package, el juego no necesita internet. 

## Problemas frecuentes

- **No responden las teclas:** hacer clic dentro de la ventana del juego para darle el foco.
- **Se reinicia sola la partida al perder:** se soltó ESPACIO tarde; la repetición de la tecla
  cuenta como una pulsación nueva. Soltar la tecla antes del Game Over.
- **La ventana del juego se cerró:** ejecutar de nuevo `AplicacionDino new iniciar`.
- **Falla la carga del package:** verificar que se esté usando Pharo 14 y que el clonado
  haya terminado en Iceberg.
