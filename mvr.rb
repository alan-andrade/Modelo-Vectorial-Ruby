require 'lib/load_file'
require 'lib/parser'
require 'lib/db_creator'

## Sirve para estos dos conjuntos de archivos. 'Cranfield' y 'Medline'.
## TODO: Probar con otras coleccionees de datos.

file = load_file('collections/cranfield/cran.all.1400')
#file = load_file('med/MED.ALL')

@docs = Parser.parse(file)
print "Finished with #{@docs.size} docs.\n"
@docs.first.terms
