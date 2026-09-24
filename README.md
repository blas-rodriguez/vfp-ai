# VFP-AI

Asistente de programación para Visual FoxPro 9.0, pensado para la comunidad.

**Estado: prototipo local sin conexión a una IA.** Esta primera versión permite
abrir un chat de demostración, consultar la configuración y ejecutar un formulario
escrito en PRG. Las respuestas son fijas y no interpretan las instrucciones.

El objetivo es generar y modificar código VFP 9, formularios, menús y reportes
a partir de instrucciones, con conocimiento de la estructura de tablas DBF.

## Ejecutar el prototipo

Requiere Windows y una instalación propia del entorno de desarrollo de
Visual FoxPro 9.0; se recomienda SP2. No se incluyen instaladores ni runtimes.

Desde la ventana de comandos de VFP, ejecutar (adaptando la ruta):

```foxpro
DO "C:\VFP-AI\start.prg"
```

La ventana es modal. No modifica el directorio predeterminado, no abre tablas
y no hace solicitudes de red. El historial dura solamente mientras está abierta.

- **Enviar:** agrega el texto al historial y devuelve una respuesta de demo.
- **Configuración:** muestra el estado de la integración.
- **Ver ejemplo PRG:** abre un formulario de ejemplo con un campo y un botón.

## Estructura

```text
start.prg                    Punto de entrada
src/vfp/chat.prg             Chat de demostración
src/vfp/settings.prg         Configuración de demostración
examples/hello_form.prg      Formulario nativo definido en código
config/providers.example.json  Diseño de configuración futura
docs/ARCHITECTURE.md         Arquitectura propuesta
docs/ROADMAP.md              Etapas de desarrollo
docs/VALIDATION.md           Verificación y limitaciones
```

## Alcance previsto

Primero: conectar un proveedor mediante un puente COM de 32 bits, generar PRG
y revisar cambios. Después: leer esquemas DBF, validar con VFP e incorporar
SCX/SCT, menús y reportes basados en plantillas.

El código de las aplicaciones generadas será VFP 9.0. El puente de comunicaciones
podrá estar escrito en otro lenguaje. Ni la DLL ni los adaptadores API están
implementados en este prototipo.

## Publicación y contribuciones

Este directorio es independiente de cualquier aplicación comercial existente.
No agregar datos reales, conversaciones, claves API ni componentes de terceros
sin derecho de redistribución. `.gitignore` excluye datos y artefactos locales;
no sustituye la revisión del contenido antes de publicar.

Ver [CONTRIBUTING.md](CONTRIBUTING.md) para colaborar y
[docs/PUBLISHING.md](docs/PUBLISHING.md) para crear el repositorio público.

Licencia [MIT](LICENSE).
