# Mis archivos de configuración

Aquí van mis archivos de configuración por si a alguien les son de utilidad. Algunos programas los tengo en desuso (como kitty, awesomewm, etc.), pero los mantengo también por si los retomo en algún momento.

Los que pueden temer más interés, porque están actualizados y los he ido elaborando más son:

- Neovim: es una versión propia que tomé empezando con [kickstart](https://github.com/nvim-lua/kickstart.nvim) y lo he ido armando tomando como referencia [LazyVim](https://github.com/LazyVim/LazyVim), pero un poco más simple.
- VSCode: lo uso con el plugin de vim y tiene unos cuantos atajos de teclado para acercarse a mi configuración de neovim.
- Awesomewm: Es el window manager que uso actualmente, tiene dos temas muy similares que son modificaciones que vienen de copiar cosas de [copycats](https://github.com/lcpz/awesome-copycats).
- Qtile: no lo uso actualmente, pero en principio funciona todo bien
- BSPWM: no lo uso actualmente, pero deberia funcionar bien los archivos de bspwm, polybar, picom y sxhkd.
- Exploradores de archivos: estoy usando, sobretodo, LF y quedó bastante customizado (con iconos, acciones extra, etc.) y cada vez más NNN, porque las previsualizaciones funcionan muy bien. Incluso se pueden ver imágenes desde Neovim. Probando tambien Yazi
- ZSH: Hay bastantes aliases y funciones creadas. No uso oh-my-zsh, los plugins están añadidos por [antidote](https://github.com/mattmc3/antidote)
- Tmux: es una configuración propia y más o menos corta.
- Rofi: los temas que estén seleccionados o comentados son los que hice o customicé yo.
- Kitty, Wezterm y Alacritty: son los terminales que uso, actualmente Kitty, pero no les he añadido gran cosa más allá de las fuentes, los temas y algún que otro atajo de teclado.
- Scripts: Los que más pueden ser de utilidad son:
    - estatus: Si se pone en el "path" al escribir "estatus" comprueba carpetas o repositorios y dice en que estatus de git está. Funciona bastante bien, en algún momento le haré un repositorio propio.
    - Hasi: "empezar" en euskera, es un script en python con algunos similares notas.py, en algún momento les haré un repositorio propio y explicaré como usarlos. Básicamente al escribir "hasi" permite seleccionar una carpeta Documentos y de ella hace una sesión de tmux, con una ventana en neovim y otra sin nada. Si tiene posibilidad de hacer correr "npm run dev" lo ejecuta y si se le añade un parámetro, como "hasi nvim" lo busca en zoxide y lo crea desde ahí. Codear hace algo parecido pero abriendo el vs code y notas va a la carpeta que tengo asignada para notas.
    - El de inicio: funciona bien, carga un par de programas y los pone en el inicio.
    - Rofi-power-menu: un pequeño menú configurado en sxhkd con el atajo ctrl + esc, que da opciones de apagado, reinicio, etc. Con iconos y demás.
    - xmodmap: modifica el teclado para reubicar el bloq. mayús a esc y Alt gr + - a "/", muy cómodo para teclados en español.
    - switch_workspace_mode.sh: cambia los iconos del polybar entre dos modos que están en la misma carpeta de polybar.

### Colorschemes

Voy alternando entre [https://github.com/sainnhe/gruvbox-material](gruvbox-material) y [https://github.com/rebelot/kanagawa.nvim](kanagawa), así que prácticamente todo tiene versiones para ambos (una comentada y otra no). Suelo poner el fondo en casi negro.

### TODO
- Documentar y separar los scripts que merecerían repositorios aparte (el de estatus y el de hasi)
