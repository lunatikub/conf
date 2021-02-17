****
Wifi
****

.. contents:: Table of contents
              :local:

**nmcli** is the command to manage the wifi !

List
****

.. code-block:: bash

   ❯❯❯ nmcli device wifi list
   IN-USE  BSSID              SSID             MODE   CHAN  RATE        SIGNAL  BARS  SECURITY
           34:27:92:D0:21:E8  Freebox-618730   Infra  6     260 Mbit/s  57      ▂▄▆_  WPA2
           34:27:92:D0:21:EE  Freebox-618730   Infra  108   540 Mbit/s  55      ▂▄__  WPA2
           30:7C:B2:63:72:0D  Livebox-720D     Infra  11    130 Mbit/s  54      ▂▄__  WPA1 WPA2
           34:27:92:D0:21:EC  Freebox-618730   Infra  36    540 Mbit/s  47      ▂▄__  WPA2
           46:D2:44:76:C9:6D  DIRECT-4476496D  Infra  11    65 Mbit/s   44      ▂▄__  WPA2
           30:7C:B2:63:72:0E  Livebox-720D     Infra  132   405 Mbit/s  44      ▂▄__  WPA1 WPA2

Add
***

.. code-block:: bash

   ❯❯❯ nmcli device wifi connect <SSID> password <PWD>
