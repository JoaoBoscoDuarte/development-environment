#!/bin/bash
# Instalação do Alacritty (compilado do source)

log_info "Instalando Alacritty"
git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
cd /tmp/alacritty

cargo build --release

sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

sudo mkdir -p /usr/local/share/man/man1 /usr/local/share/man/man5 /usr/local/share/man/man7
scdoc < extra/man/alacritty.1.scd       | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd   | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd       | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null
scdoc < extra/man/alacritty-escapes.7.scd  | gzip -c | sudo tee /usr/local/share/man/man7/alacritty-escapes.7.gz > /dev/null

grep -qxF "source /tmp/alacritty/extra/completions/alacritty.bash" ~/.bashrc \
    || echo "source /tmp/alacritty/extra/completions/alacritty.bash" >> ~/.bashrc

cd ~ && rm -rf /tmp/alacritty
