# Instalaciones


#### APT

Actualizar:

``` bash
sudo apt update && sudo apt upgrade
```


Instalar (en uso):
``` bash
sudo apt install fzf rofi dmenu git python-pip fish awesome picom tmux zathura stow
```

Instalar (opcionales):
``` bash
sudo apt install zsh ranger alacritty lf
```

Instalar (opcionales):
``` bash
sudo apt install zsh ranger 
```



#### NVIM

- Dependencias(oficiales):
``` bash
sudo apt-get install ninja-build gettext cmake unzip curl
```

- Dependencias(extra):
``` bash
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
```
[ Otras dependencias ]( https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites )


- Descargar:

```bash 
git clone https://github.com/neovim/neovim

```

- Construir (General):
```bash 
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
```


- Construir (Para debian):
```bash 
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
```



- Instalar:

```bash 
sudo make install
```

[Documentacion oficial](https://github.com/neovim/neovim/blob/master/BUILD.md)


#### NerdFonts

- Crear ubicación:
```bash
mkdir ~/.fonts
```


- Instalador automático, [sitio github](https://github.com/officialrajdeepsingh/nerd-fonts-installer)
``` 
bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)" 
```

#### Kitty


Instalador:
``` bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

```
Integracion de escritorio

``` bash
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
```
#### Cambiar la shell

A Fish
``` bash
chsh -s $(which fish)
```

A Zsh

```bash
chsh -s $(which zsh)
```

