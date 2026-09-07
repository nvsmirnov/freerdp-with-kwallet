# freerdp-with-kwallet

Wrapper scripts to run xfreerdp under KDE without remmina, storing credentials in KWallet.

I wrote it just for myself because remmina had issues with graphics lags on slow internet & uncomfortable float bar.

To set up (here is example for debian):

- Install preferred version of freerdp along with needed utilities (one of `freerdp3-x11`, `freerdp3-wayland`, `freerdp-sdl`):

  `apt-get install -y freerdp3-x11 yad python3`

  note: as of September 2026, only -x11 version supports float-bar, and only on native x11 (not wayland-x11)

- `curl -sSf https://raw.githubusercontent.com/nvsmirnov/freerdp-with-kwallet/refs/heads/main/install.sh | sudo bash`
  
  - it will install scripts to `/usr/local/bin`, but you can install them to user-writable directory without sudo:

    `curl -sSf https://raw.githubusercontent.com/nvsmirnov/freerdp-with-kwallet/refs/heads/main/install.sh | DESTDIR=~/bin bash`

- Make a copy of `freerdp-with-kwallet-host-sample.sh` from the install directory (default `/usr/local/bin/freerdp-with-kwallet-host-sample.sh`), edit it to your needs.

- Create KDE desktop item, i.e.:
  - right click on application launcher menu
  - Edit applications
  - New
  - Then it is all obvious :)

If needed, you can use shared secret for different hosts (see `freerdp-with-kwallet-host-sample.sh`: `SECRET_ID` is KWallet secret ID, by default is same as host, but you can use any string there for sharing secrets between different connection scripts)
