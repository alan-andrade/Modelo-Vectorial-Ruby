require 'load_file.rb'
require 'builder'

class Doc
  attr_accessor :index, :title, :author, :bibliography, :content, :terms
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
      @doc.index = $2
    end
    
    # ESTE codigo es muuuyyy repetitivo. Se puedo arreglar usando Metaprogramacion, pero no me salia :S hahaha.
    
    if $3
      case $3
        when 'T'
          @temp_attr = 'T'
        when 'A'
          @temp_attr = 'A'
        when 'B'
          @temp_attr = 'B'
        when 'W'
          @temp_attr = 'W'
      end         
    end
    
    if $4
      if @temp_attr == 'T'
        @doc.title = '' if @doc.title.nil?
        @doc.title        <<  $4 
      end
      if @temp_attr == 'A'
        @doc.author = '' if @doc.author.nil?
        @doc.author       <<  $4
      end
      if @temp_attr == 'B'
        @doc.bibliography = '' if @doc.bibliography.nil?
        @doc.bibliography <<  $4
      end
      if @temp_attr == 'W'
        @doc.content      = '' if @doc.content.nil?
        @doc.content      <<  $4        
      end
    end
    
  end  # file.gets
end
puts
for doc in @docs
  
  doc.terms = doc.content.to_s.gsub(/\W+/, ' ').split(' ').uniq.to_s
end

puts @docs.first.terms
