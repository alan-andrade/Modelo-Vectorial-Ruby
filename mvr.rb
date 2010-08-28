require 'load_file.rb'
require 'builder'

class Doc
  #attr_accessor :index, :title, :author, :bibliography, :content, :terms
  
  def initialize
    @attributes = {}
  end
  
  def method_missing(name, *args)
    method = name.to_s.downcase
    if method =~ /=$/
      @attributes[method.chop] = args[0]
    elsif method =~ /<<$/
      method = method.chop.chop
      @attributes[method] = "" if send(method).nil?
      @attributes[method] << (args[0] || "")
    else
      @attributes[method]
    end
  end
end


file = load_file('cranfield/cran.all.1400')

parseo_x_regexp = /^\.([A-Z]) (\d*)|^\.([A-Z])|(^[^\.].*)/

# $1 Existe un indice
# $2 Numero de Indice
# $3 Atributo
# $4 Contenido de Atributo

@docs = []
#until file.eof? do
180.times do
  if file.gets =~ parseo_x_regexp
    
    if $1 and $2
      @docs << @doc if @doc
      @doc = Doc.new();
      @doc.send ($1.to_s << "=").to_sym, $2
    end
        
    if $3
      @doc.send ($3.to_s << "<<").to_sym, $4
      @doc.temp = $3.to_s.downcase
    end
    
    if $4
      @doc.send (@doc.temp + "<<").to_sym, $4
    end
    
  end  # file.gets
end
puts

for doc in @docs  
  doc.terms = doc.w.to_s.gsub(/\W+/, ' ').split(' ').uniq.to_s
end

print @docs.first
