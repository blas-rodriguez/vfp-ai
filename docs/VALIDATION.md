# Validación

## Estado de esta entrega

Se intentó iniciar `VisualFoxPro.Application.9` mediante COM en la máquina de
desarrollo. Windows rechazó la activación con `0x800702E4` (requiere elevación).
Por ese motivo **no se pudo compilar ni instanciar los formularios de forma
automática**. Tampoco se realizó una inspección visual. Las comprobaciones del
IDE indicadas abajo siguen pendientes.

Se revisan por separado el JSON de ejemplo, la codificación ASCII de los PRG
y las exclusiones de Git. Esas comprobaciones no validan la sintaxis de VFP.

## Comprobaciones manuales

En el IDE de Visual FoxPro 9:

1. Ejecutar `DO "C:\VFP-AI\start.prg"`, adaptando la ruta.
2. Confirmar que se identifica como demo local y que el historial inicial aparece.
3. Enviar texto: debe aparecer junto a una respuesta marcada como demo.
4. Enviar un mensaje vacío: el historial no debe cambiar.
5. Abrir y cerrar Configuración: debe indicar que las APIs están pendientes.
6. Abrir Ver ejemplo PRG, escribir un nombre y pulsar Saludar.
7. Confirmar que Saludar sin nombre muestra una indicación para completarlo.
8. Cerrar las ventanas: debe volver al IDE sin finalizar la sesión de VFP.
9. Repetir desde otro directorio predeterminado para verificar rutas.

La compilación y la instanciación de objetos pueden automatizarse usando una
instancia COM de VFP 9. Esto no reemplaza la inspección visual ni prueba una API.

## Alcance

No hay pruebas de proveedores, de generación automática ni de acceso a DBF:
esas funciones todavía no están implementadas. No se ha definido aún una matriz
de compatibilidad entre versiones de Windows.
