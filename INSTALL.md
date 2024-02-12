# Instalaciones


#### APT

Actualizar:

``` bash
sudo apt update && sudo apt upgrade
```


Instalar (en uso):
``` bash
sudo apt install fzf rofi curl dmenu git fish awesome picom tmux zathura stow zsh curl  copyq stow gpick htop python3-venv python3-pip lxappearance volumeicon-alsa wmctrl  zoxide gpick playerctl brightnessctl
```

Instalar (opcionales):
``` bash
sudo apt install ranger alacritty lf arandr pipx
```

Instalar (programas):
``` bash
sudo apt install gimp thunderbird gnome-boxes libvirt-clients
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

#### ZSH powerlevel
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
echo 'source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
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

#### Antidote

``` bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.zsh/antidote

```
#### GO
Instalar Go
[https://go.dev/doc/install]
[https://phoenixnap.com/kb/debian-install-go]

LazyGit
``` bash
git clone https://github.com/jesseduffield/lazygit.git
cd lazygit
go install
```

Lf
``` bash
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
```

#### Rust






#### Brave browser

``` bash

sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
```


#### NPM y node
¿Cómo instalarlo? El menos problemático fue [ nvm ]( https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating )

``` bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
``` bash
npm install -g live-server
```

#### Flatpak
Activar Flatpak en Debian

 <!-- TODO: -->



Obsidian

``` bash
flatpak install flathub md.obsidian.Obsidian
```
``` bash
npm install -g live-server
```

