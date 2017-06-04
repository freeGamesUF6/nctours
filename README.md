# Spring NatureCity Tours
## Treball de fi de curs de desenvolupament d'aplicacions webs (DAW 2016/2017)
## Inicia l'aplicació en local

```
	git clone https://github.com/freeGamesUF6/nctours.git
	cd nctours
	./mvnw spring-boot:run
```

Accedir a aquest enllaç: http://localhost:8080/

<img width="1042" alt="nctours-screenshot" src="https://raw.githubusercontent.com/freeGamesUF6/nctours/5d15f1abf21edb047558188be700b8dd3c760680/src/main/resources/static/resources/images/nctorus.PNG">

## En cas de trobar un error / suggeriment de millora

El nostre seguiment d'incidències està disponible aquí: https://github.com/freeGamesUF6/nctours/issues

## Configuració de la Base de Dades

En la seva configuració per defecte, NatureCity càrrega una base de dades en memòria (HSQLDB), que s'omple en l'arrencada amb dades. Es proporciona una configuració similar per MySql en cas que es necessita una configuració de base de dades persistent. Recordeu que cada vegada que es canvia el tipus de base de dades, l'arxiu data-access.properties necessita ser actualitzat i l'artefacte mysql-connector-java des del pom.xml ha de ser sense fer comentaris.
