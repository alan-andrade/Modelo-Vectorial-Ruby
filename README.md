# Primer Desafio

1. Cargar Archivo (listo)
2. Pasear los diferentes atributos (listo)
3. Crear archivo XML para tener una facilidad superior de manipulacion


## Notas adicionales
La arquitectura esta bien mal organizada. De hecho ahorita ni siquiera existe una. Me gustaria separar todo chingon en componentes para 
que se puedan hacer cambios sin romper la funcionalidad.

Propuesta.
      -File Loader
        |
        |- Todo lo encargado de cargar el archivo.
      -Parser
        |
        |- Lo que hace el Parseo. Quiza aqui agregar lo que quita las comas y busca las raices.
      -Matrix
        |- Responsable de hacer el producto punto y todo eso.
        

