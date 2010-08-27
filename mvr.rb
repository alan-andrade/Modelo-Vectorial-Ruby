require 'load_file.rb'

file = load_file('cranfield/cran.all.1400')

regexp = /^\.([A-Z]) (\d*)|^\.([A-Z])|(^[^\.].*)/
# $1 Existe un indice
# $2 Numero de Indice
# $3 Atributo
# $4 Contenido de Atributo

### until file.eof? do
800.times do
  if file.gets =~ regexp
    print "Index: #{$2}\n" if $1 and $2
    print "Atributo: #{$3}\n" if $3
    print "\t#{$4}\n" if $4
  end  
end
