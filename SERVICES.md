# M239 REST-API Übungen mit Postman

## Vorbereitung
- [Postman](https://www.postman.com/download) downloaden 
- Postman-Account erstellen (free) und einloggen
- Postman Starten

## Erste Übung:  GET-REQUEST

1. Öffnen Sie im Postman-Fenster oben in der Mitte einen neuen Tab 
1. Wählen Sie die GET-Methode aus und ergänzen Sie das Feld nebenan wie folgt: ${ADDR}:3000/books  
	...es erscheint eine Statusmeldung "403 Forbidden" --> Wurde von der Firma bewusst so implementiert:     
	--> Unter https://developer.mozilla.org/de/docs/Web/HTTP/Status/403 finden Sie ergänzende Informationen.  
		- Was interpretieren Sie daraus?  
		- Wie könnte dieses Problem gelöst werden?

	**Antwort**  
	Die Firma erfordert ein API-Token. So können die API-Zugriffe der Kunden nach dem Nutzungsprinzip verrechnet werden.  
	Der Token besteht aus folgendem Key/Value-Pair -->  Key: G-TOKEN  Value: ROM831ESV  
	ACHTUNG: damit wird dem Benutzer lediglich ermöglicht, auf die Serverdaten zuzugreifen. Es wurde noch KEINE Authentisierung durchgeführt!

	Tragen Sie dieses Key/Value-Pair im "Header" ein und senden sie denselben GET-Request anschliessend nochmals ab.  
		- Welchen Status-Code erhalten Sie?  
		- Welchen Output erhalten Sie?  Wenn Sie unter "Pretty"-View schauen, sehen Sie div. Einträge. Um was handelt es sich?  


1. Wählen Sie die GET-Methode aus und ergänzen Sie das Feld nebenan wie folgt: ${ADDR}:3000/books/1  
		- Was ändert sich am Output?   
		- Nach welchem Kriterium wird mit dieser URI gefiltert?  
		- Hovern Sie mit dem Mauszeiger über die Zeitangabe (in ms, neben dem Statuscode) - Wieviel % des gesamten Events  
		  nimmt der TCP-Handshake in Anspruch? (Angaben können variieren)  
		
1. Wählen Sie die GET-Methode aus und ergänzen Sie das Feld nebenan wie folgt: ${ADDR}:3000/books/search   
    Klicken Sie vor dem "Senden" auf den "Params"-Tab (links, unterhalb der GET-Eingabezeile)  
    Beziehen Sie sich auf den letzten Output und geben Sie im "Key"-Feld den Begriff "title" und im "Value"-Feld "letters" ein (keine Grossbuchstaben)  
		- Wie sieht der Output aus?   
		- Wie sieht die URL oben beim Get-Request nach dem "Fragezeichen" aus?   
		- Wie nennt man den Text hinter dem Fragezeichen?  

    Beziehen Sie sich auf den letzten Output und geben Sie in der ZWEITEN Zeile im "Key"-Feld den Begriff "author" und im "Value"-Feld "a" ein (keine Grossbuchstaben).
		- Weshalb gibt es jetzt keinen Output? 
		- Wie sieht die URL oben beim Get-Request nach dem "Fragezeichen" jetzt aus?  
		- Was bedeutet das Kaufmannszeichen "&"?  

1. Öffnen Sie einen neuen Tab. Wählen Sie die GET-Methode aus und ergänzen Sie das Feld nebenan wie folgt: ${ADDR}:3000/books
		- Vergessen Sie dabei nicht, dass Sie auch hier den Token im Header eintragen, damit Sie Abfragen durchführen können -->  Key: G-TOKEN  Value: ROM831ESV  
		- Wählen Sie die GET-Methode aus und ergänzen Sie das Feld nebenan wie folgt: ${ADDR}:3000/books.   
		- Klicken Sie jetzt beim "Send"-Buttom auf den weissen Pfeil und wählen Sie "Send and Download" aus --> Der Output wird nun in Form eines .json-Files auf Ihren 
		  Rechner runtergeladen (response.json)  


## Zweite Übung:  POST-Request (Neue Items in die Inventarliste eintragen)

1. Öffnen Sie im Postman-Fenster oben in der Mitte einen neuen Tab. Vergessen Sie nicht, jedes Mal nach dem Öffnen den Token ergänzen.  
   Key: G-TOKEN  Value: ROM831ESV
3. Wählen Sie die POST-Methode aus und ergänzen Sie das Feld nebenan wie folgt: ${ADDR}:3000/books
   Klicken Sie vor dem "Senden" auf den "Body"-Tab (vierter Eintrag unterhalb der Methoden-Eingabezeile)
   Die M239-GmbH erlaubt lediglich "raw"-Daten. Klicken Sie deshalb auf den entsprechenden "Radio-Buttom" (vierter von links)
   Es erscheint unterhalb eine Text-Box. Geben Sie folgende 6 Zeilen ein (inkl. geschweifte Klammern)

        {
            "title": "HTTP und RestAPI im Modul 239",
            "author": "TBZ-Lernender",
            "isbn": "M239",
            "releaseDate": "2021-03-15"
        }

   Klicken Sie nun auf den Buttom "Send"  
	 - Wie sieht der Output aus? Welchen Status-Code erhalten Sie?						<-- 500 (internal Server Error") - Server kommt nicht klar  
	 - Welche Fehlermeldung?											<-- "error": Title cannot be null"  
	 - Macht diese Fehlermeldung Sinn, wenn ich den eingegebenen Text nochmals verifiziere? (1. Zeile)	<-- Nicht offensichtlich, denn "title" wurde definiert  
	 - Was könnte ein möglicher Grund sein? 									<-- Es wurde nicht definiert, um welches Datenformat es sich handelt (jpeg, pdf, json etc...)  
  
   ...um das Problem zu lösen, muss ich im Header angeben, um welches Datenformat es sich beim Eintrag handelt und wieviel Platz dieser Content beansprucht (dieser kann mitgeliefert werden und wird automatisch berechnet)  
   Unter "Header" die beiden entsprechenden Key/Value-Pairs eintragen:  -->  
   1.) Key: "Content-Type" Value: "application/json"  ...falls das noch nicht reicht, ergänzen Sie noch das folgende Key/Value-Pair  
	 2.) Key: "Content-Length" Value <calculated when request is sent>  

   Dann nochmals die POST-Methode ausführen - Feld nebenan bleibt wie bisher: ${ADDR}:3000/books  
	 ...es erscheint eine Statusmeldung "201 Created" (The request has been fulfilled and resulted in a new resource beeing created)  
	 - Wie interpretieren Sie diesen Status-Code und die entsprechende Meldung?				<-- 201 Alle 2xx-er Meldungen sind Success-Meldungen. Der Eintrag wurde durchgeführt -
																In diesem Fall wurde eine neue Ressource erstellt)	 

    Wiederholen sie das 3x (POST ${ADDR}:3000/books --> Send)  - derselbe Eintrag wird 3x erstellt (3x Redundant). Brauchen wir für die nächste Übung


# Dritte Übung:  POST-Request - Items aus Inventarliste löschen
Beim Löschen von Items kommt "Authorization" ins Spiel. Bisher brauchten wir das nicht, weil wir nur Daten abgefragt und eingtragen haben.
Beim Löschen möchte das System wissen wer der Anfrager ist, um sicherzustellen, damit nicht Unbefugte Daten entfernen können.

1. In den Übungen vorher wurden Einträge allenfalls redundant eingetragen. Um das zu überprüfen, rufen wir wieder mit folgendem Eintrag die DB ab: ${ADDR}:3000/books (Header-Infos müssen definiert sein!)
   Sie erhalten ein Listing mit Bucheinträgen. Angenommen, zur ID 9 hätte es redundante Einträge, welche gelöscht werden sollen:

1. DELETE ${ADDR}:3000/books/9 eingeben und auf den Buttom "Send" drücken:  
		- Wie sieht der Output aus? Welchen Status-Code erhalten Sie?						<-- 401 Unauthorized   <-- Gem. https://httpstatuses.com/  
		- Welche Fehlermeldung?											<-- Siehe https://httpstatuses.com/ (The server generating a 401 response MUST send a WWW-Authenticate header field...  
		- Was könnte ein möglicher Grund sein und wie lässt sich das Problem beheben? 				<-- Authorization: Um Daten zu löschen, muss man sich authentifizieren   
		- Unter "Authorization, Type "Basic Auth" Username: admin / Passwort: admin eingeben und nochmals durchführen  
		- Wie sieht der Output aus? Welchen Status-Code erhalten Sie?						<-- 204 No Content   <-- Gem. https://httpstatuses.com/  
		- Welchen Output?											<-- Keinen, da Content gelöscht wurde, wird nichts angezeigt  



# Challenge

Erstellen Sie einen Eintrag mit folgendem Content

      {
          "title": "Erste Schritte mit RESTful API erfolgreich durchgeführt",
          "author": "Ihr Vor- und Nachname",
          "isbn": "M239",
          "releaseDate": "2021-03-15"
      }
