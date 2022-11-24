# Backend for API Rick and Morty
Backend para los servicios de la API Rick and Morty para la app hecha en Flutter para la asiganatura de Programación Móvil.

Se debe tener instalado previamente las dependencias del repositorio.
```shell
npm i -g nodemon
npm i
```

## Ejecución local
Para ejecutar localmente el proyecto se puede utilizar alguno de los siguientes comandos (habiendo compilado el proyecto previamente):
### Abrir una consola Para compilar
```shell
tsc --watch
```
### Abrir una consola Para desplegar
```shell
nodemon dist/app.js
```

## Tests
Las pruebas se ubican en ./test y después de ejecutarlas se crea un archivo con el coverage ubicado en ./coverage            
Se pueden ejecutar con el siguiente comando:
```shell
tsc coverage
```