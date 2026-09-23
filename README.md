# my-config

Configuración personal para Arch Linux con Hyprland, KDE/GTK, terminales,
shells, temas y herramientas de línea de comandos.

## Instalación

```bash
git clone https://github.com/bacamarvin/my-config.git
cd my-config
./install.sh
```

El instalador:

- crea un respaldo en `~/.dotfiles-backups/<fecha>/`;
- instala los archivos de shell y las configuraciones seleccionadas;
- pide el nombre y correo de Git en vez de guardar la identidad personal;
- conserva las rutas portables usando `$HOME`.

Se recomienda tener instalados previamente Hyprland, KDE Plasma, Kitty o
Foot, Fish/Zsh, Starship, Matugen, Kvantum y las dependencias usadas por los
scripts de Hyprland. El instalador no instala paquetes del sistema.

## Alcance y seguridad

Este repositorio contiene configuración, no credenciales. No se incluyen
historiales, cachés, sesiones de aplicaciones, claves SSH/GPG, navegadores,
archivos `.env`, fondos personales ni bases de datos. Los temas incluidos son
los ligeros y reutilizables; los paquetes duplicados de iconos de distintas
densidades se mantienen fuera del repositorio.

Antes de compartirlo públicamente, revisa los archivos de configuración y
ejecuta una búsqueda de secretos:

```bash
git grep -nEi 'token|secret|password|api[_-]?key|private key'
```
