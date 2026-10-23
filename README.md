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

## Efectos y privacidad

`install.sh` copia configuración sobre el perfil del usuario y mezcla
directorios existentes. Guarda un respaldo, pero no ofrece vista previa ni
restauración automática. Revísalo antes de ejecutarlo y prueba primero con
un perfil de usuario desechable.

El script `.config/hypr/hyprland/scripts/snip_to_search.sh` sube la captura
seleccionada a un servicio externo. No lo uses con información privada.
Revisa los atajos que lo invocan y prepara una confirmación explícita antes
de habilitarlo en otro equipo.

Las dependencias varían por función: algunos scripts necesitan `jq`,
`curl`, `grim`, `slurp`, `wl-clipboard`, `fuzzel` u Ollama.
Documenta y comprueba solo las funciones que quieras instalar.

Los temas y scripts incorporados requieren un inventario de procedencia y
licencias antes de su redistribución.

