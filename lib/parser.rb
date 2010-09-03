require 'lib/stemmable'
require "lib/doc"


class Parser
  def self.parse(file)
    raise 'NoFileGiven'       unless  file
#    raise 'Not a FILE object' if      file.class != 'File'
    
    
    regexp = /^\.([A-Z]) (\d*)|^\.([A-Z])|(^[^\.].*)/

    # $1 Existe un indice
    # $2 Numero de Indice
    # $3 Atributo
    # $4 Contenido de Atributo

    @docs = []
    print "Parsing...\n"
    until file.eof? do
      if file.gets =~ regexp
        
        if $1 and $2
          if @doc
            @doc.terms_definition
            @docs << @doc
          end  
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
      end  # regexp match
    end #file.gets
    @doc.terms_definition;@docs << @doc #Save last doc.
    
    file.close

    print "Parsing: Done\n"  
    
    @docs #return the array of docs.
  end

end
