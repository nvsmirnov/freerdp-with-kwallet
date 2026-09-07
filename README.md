# freerdp-with-kwallet

Wrapper scripts to run xfreerdp under KDE, storing credentials in KWallet.

Wrote it because there were issues with using remmina (graphics lags on slow internet, uncomfortable float bar).

To set up:
- `apt-get install -y yad python3 freerdp3-x11`
  note: as of september 2026, only -x11 version and only under x11 (not wayland) sopports float-bar
- place `freerdp-with-kwallet` and `freerdp-with-kwallet-write-helper` to directory which is in PATH
- create custom script for your RDP connection (sample: `rdp-sample.sh`), use this script to start connection

If needed, you can use shared secret for diferent hosts (see `rdp-sample.sh`: `SECRET_ID` is KWallet secret ID, by default is same as host, but you can use any string there for sharing secrets between different connection scripts)
