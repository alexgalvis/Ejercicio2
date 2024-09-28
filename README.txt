# Instrucciones para la ejecución

## Requisitos:
 - Java 11 o superior
 - Gradle 6.8 o superior

## Pasos para ejecutar el proyecto

1. Clonar el repositorio en la máquina donde se va a ejecutar

2. Navega hasta la raíz del proyecto.

3. Para ejecutar las pruebas ejecuta los siguientes comandos según sea el caso:
    Ejecución paralela: ./gradlew test --tests ParallelTests
    Ejecución runner especifico: ./gradlew test --tests PetStoreRunner

4. Una vez ejecutadas las pruebas, los reportes generados los puedes consultar en el directorio:
 - Reporte de Karate: build/karate-reports/karate-summary.html
 - Reporte de Cucumber: build/cucumber-html-reports/overview-feature.html