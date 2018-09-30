# i3wm_configs
My i3 windows manager configuration files
for Linux Mint 18.3 <br />
copy i3 folder to ~/.config <br />
and i3blocks folder to /usr/share <br />

# Packages to install

i3 <br />
i3-wm <br />
i3lock <br />
suckless-tools <br />
i3blocks <br />
i3status <br />
feh <br />
lxappearance <br />
scrot <br />
compton <br />

and i3gaps <br />
https://github.com/Airblader/i3/wiki/Compiling-&-Installing
without this, there is a memory leak bug

>Please refer to the Dependencies section to see whether a package for i3-gaps is available for your distribution. If not, >you can install i3-gaps roughly as follows. Please note that these are instructions aimed at package maintainers. We don't >intend users to compile from source on their own.
>
>Questions regarding the compilation will only be answered in the following cases:
>
>You are working on providing a package for i3-gaps.
>You need to compile from source to debug an issue in the latest version.
>You have pinged your distribution's package maintainers to provide a proper package and can link to that request.
>If one of these cases apply to you, please mention this in your issue. Other questions regarding how to compile (rather than >a bug in the compilation) will be closed.
>
>cd /path/where/you/want/the/repository
>
> clone the repository
>git clone https://www.github.com/Airblader/i3 i3-gaps
>cd i3-gaps
>
> compile & install
>autoreconf --force --install
>rm -rf build/
>mkdir -p build && cd build/
>
> Disabling sanitizers is important for release versions! <br />
> The prefix and sysconfdir are, obviously, dependent on the distribution. <br />
>../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers <br />
>make <br />
>sudo make install <br />
>If you haven't installed i3 before, you will likely get compilation errors due to missing packages. To solve that, install >all required dependencies as listed in the section below and rerun make && sudo make install
