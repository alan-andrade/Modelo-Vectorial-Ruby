# Algoritmo a gandes rasgos

1. Cargar Archivo (listo)
2. Pasear los diferentes atributos (listo)
3. Colocar esos atributos en un objeto de tipo DOC (listo)
4. Calcular pesos ya teniendo los terminos de cada doc en una variable llamada term.
5. Consulta
6. Entregar resultados.


## Notas adicionales
La arquitectura esta bien mal organizada. De hecho ahorita ni siquiera existe una. Me gustaria separar todo chingon en componentes para 
que se puedan hacer cambios sin romper la funcionalidad.

Propuesta.
       -MVR
       |
       |-File Loader
          |
          |- Todo lo encargado de cargar el archivo.
        -Parser
          |
          |- Lo que hace el Parseo. Quiza aqui agregar lo que quita las comas y busca las raices.
        -Matrix
          |- Responsable de hacer el producto punto y todo eso.
        

