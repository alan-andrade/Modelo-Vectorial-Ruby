require 'lib/load_file.rb'
require 'lib/parser.rb'

## Sirve para estos dos conjuntos de archivos. 'Cranfield' y 'Medline'.
## TODO: Probar con otras coleccionees de datos.

file = load_file('cranfield/cran.all.1400')
#file = load_file('med/MED.ALL')

@docs = parse(file)
print "Finished with #{@docs.size} docs.\n"
puts @docs.first
