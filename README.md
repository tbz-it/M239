# Modul 239: Internet Server in Betrieb nehmen

Internetserver mit verschiedenen Diensten konfigurieren und in Betrieb nehmen und dabei Sicherheitsvorgaben und betriebliche Anforderungen beachten

### Node.js inkl. Postman-Repo für Einstieg ins Thema REST-API
Node.js v15 startet nach dem Bootprozess der VM automatisch (Added 23.1. KAE/CAL) 
Im Verzeichnis "postman" ist ein Repository von Nate Taylor bereitgestellt. Geeignet für diverse REST-Abfragen mit div. HTTP-Methoden 

### Samba/SMB

Seit 1992 bietet [Samba](https://www.samba.org/) sichere, stabile und schnelle Datei- und Druckdienste für alle Clients, die das SMB / CIFS-Protokoll verwenden, z. B. alle DOS- und Windows-Versionen, OS / 2, Linux und viele andere.

Auf der Server ist Samba aktiviert und das Verzeichnis `/home/ubuntu/data` als Share `data` freigegeben.

Zugriff mittels:

    \\${ADDR}\data
    
### Apache Web Server

Das Verzeichnis `/home/ubuntu/data` ist verlinkt in `/var/www/html` und unter dem URL [${ADDR}/data](${ADDR}/data) erreichbar.  

