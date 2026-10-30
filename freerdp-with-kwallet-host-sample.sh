#!/bin/bash

HOST="my.rdp.host"

SECRET_ID="$HOST"

FREERP_OPTIONS=(
  "/v:$HOST"
  /auth-pkg-list:none,ntlm  # to disable irrelevant kerberos error messages
  /log-filters:com.freerdp.utils.passphrase:OFF,com.freerdp.crypto:ERROR  # to disable irrelevant error messages
  /cert:ignore # use together with /log-filters:com.freerdp.crypto:ERROR
  /gfx:progressive
  /gdi:hw # better performance on low-end equipment and laggy channels comparing remmina
  /floatbar:sticky:off,default:visible,show:fullscreen
  /prevent-session-lock:300
  /auto-reconnect
  /f
)

RUN_RDP_KWALLET_SECRET_ID="$SECRET_ID" exec "freerdp-with-kwallet" "${FREERP_OPTIONS[@]}"
