# Pruebas de API Automatizadas: Proyecto Ofertador

Debido al diseño y la criticidad del proyecto es necesario automatizar las pruebas de dicha API para garantizar la continuidad, apoyar al equipo en el desarrollo, y respaldar las reglas de negocios que vinculan dicho proyecto.

## Diseño

El proyecto esta basado en [KarateDSL](https://github.com/intuit/karate). KarateDSL es una herramienta opensource creada para automatizar pruebas a nivel de API basado en sintaxis de BDD y que aprovecha todos las caracteristicas de [Cucumber](https://cucumber.io/). 

## Requerimientos Necesarios
Para poder ejecutar el proyecto en tu equipo local debes tener instalado y configurado lo siguiente:
- Java 8 o superior -> [Descargar](https://www.oracle.com/technetwork/java/javase/downloads/index.html)
- Gradle -> [Descargar](https://gradle.org/)
- IntelliJ -> [Descargar](https://www.jetbrains.com/idea/)


## Ejecución
Para correr las pruebas debes inicialmente importar el proyecto al IntelliJ.

Una vez que el IDE haya indexado los archivos hay tres maneras de ejecutar las pruebas:
- Una clase llamada Runner.java,
- por medio de lineas de comando usando gradle
```bash
./gradlew test -Dtest=Runner
```
- ó simplemente instalando un [plugin de Cucumber](https://plugins.jetbrains.com/plugin/7212-cucumber-for-java) al IDE y ejecutas el archivo ".feature"

## Info Adicional
- El proyecto tiene un archivo llamado "karate-config.js" donde está declarado los endpoints (URL de UAT).
- Una vez finalizadas las pruebas se crea un reporte automatico en la carpeta "target"
- Si deseas ejecutar los test de forma paralela (para disminuir los tiempo) puedes ejecutar el archivo "RunParallel.java"
```bash
./gradlew test -Dtest=RunParallel
```

## Soporte
Para soporte puedes ir a la documentacion de [KarateDSL](https://github.com/intuit/karate). Autor: [Gabriel Arocha](mailto:gabriel.arocharobles@cencosudscotiabank.cl)