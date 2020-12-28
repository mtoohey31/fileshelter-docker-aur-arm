FROM lopsided/archlinux

WORKDIR /opt
RUN pacman -Syyu --noconfirm && pacman -S --needed --noconfirm git base-devel go
RUN useradd yay
RUN echo "yay ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers

RUN git clone https://aur.archlinux.org/yay-git.git
RUN chown -R yay /opt/yay-git
RUN mkdir /home/yay

RUN chown -R yay /home/yay

USER yay
WORKDIR /opt/yay-git
RUN yes | makepkg -si --noconfirm
RUN yay -S --noconfirm fileshelter

RUN yay -Sc
USER root
RUN rm -rf /opt/yay-git
ENTRYPOINT fileshelter
