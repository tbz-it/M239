# Modul 239: Internet Server in Betrieb nehmen

Internetserver mit verschiedenen Diensten konfigurieren und in Betrieb nehmen und dabei Sicherheitsvorgaben und betriebliche Anforderungen beachten

### Samba/SMB

Seit 1992 bietet [Samba](https://www.samba.org/) sichere, stabile und schnelle Datei- und Druckdienste für alle Clients, die das SMB / CIFS-Protokoll verwenden, z. B. alle DOS- und Windows-Versionen, OS / 2, Linux und viele andere.

Auf der Server ist Samba aktiviert und das Verzeichnis `/home/ubuntu/data` als Share `data` freigegeben.

Zugriff mittels:

    \\${ADDR}\data
    
### Apache Web Server

Das Verzeichnis `/home/ubuntu/data` ist verlinkt in `/var/www/html` und unter dem URL [${ADDR}/data](${ADDR}/data) erreichbar.  

