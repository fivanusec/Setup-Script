echo "  ______ _ _       _                _               ";
echo " |  ____| (_)     ( )              | |              ";
echo " | |__  | |_ _ __ |/ ___   ___  ___| |_ _   _ _ __  ";
echo " |  __| | | | '_ \  / __| / __|/ _ \ __| | | | '_ \ ";
echo " | |    | | | |_) | \__ \ \__ \  __/ |_| |_| | |_) |";
echo " |_|    |_|_| .__/  |___/ |___/\___|\__|\__,_| .__/ ";
echo "            | |                              | |    ";
echo "            |_|                              |_|    ";

# Setup prep
sudo apt update
sudo apt upgrade

sudo apt install -y wget curl git

# Start process

echo ":: Prep ppa/repos"

wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo add-apt-repository ppa:aslatter/ppa
sudo apt-add-repository ppa:fish-shell/release-3

echo ":: Install deps"

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y gh alacritty neovim powerline tmux fish neofetch

echo ":: Start config"
gh auth login
gh repo clone fivanusec/My-dotfiles
cd My-dotfiles
cp -r .config ~/
cp .tmux ~/
cp .tmux.powerline ~/
chsh -s /usr/bin/fish


