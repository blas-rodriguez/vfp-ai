# Publicar el repositorio

El repositorio Git local debe ser la carpeta `VFP-AI`, independiente de otros
proyectos. No agregar una carpeta de aplicación comercial como raíz.

## Antes de publicar

- Conservar el archivo `LICENSE` con la licencia MIT elegida.
- Revisar los archivos con `git status --short` y el contenido que se incluirá.
- No agregar datos reales ni componentes de terceros sin autorización.

## GitHub

Crear un repositorio público vacío llamado `vfp-ai` en la cuenta elegida, sin
generar README, licencia ni `.gitignore` desde GitHub. Luego, desde esta carpeta:

```powershell
git add .
git diff --cached --stat
git diff --cached
git commit -m "Initial VFP 9 demo scaffold"
git remote add origin https://github.com/TU_USUARIO/vfp-ai.git
git push -u origin main
```

Reemplazar `TU_USUARIO`. Si Git no tiene identidad configurada, definir el nombre
y correo deseados para este repositorio antes del commit. Se puede usar el correo
privado proporcionado por GitHub.

La creación de la carpeta y la inicialización de Git no publican archivos en
Internet. La publicación ocurre al crear el repositorio remoto y enviar el código.
