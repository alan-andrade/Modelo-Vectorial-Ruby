require 'active_record'

class Doc < ActiveRecord::Base

  has_and_belongs_to_many :terms, :join_table=>'has'

  STOP_WORDS = %w[
    a b c d e f g h i j k l m n o p q r s t u v w x y z
    an and are as at be by for from has he in is it its
    of on that the to was were will with upon without among
  ] 
  
  def initialize
    @attributes = {}
    super
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
  
  def to_s
    @attributes.each{|a| print "#{a.first}: \t #{a.last}\n"}
  end
  
  def terms_definition
    self.tempterms = w.to_s.gsub(/\W+/, ' ').split(' ').map{|w| w.stem }
    self.tempterms.reject! { |term| STOP_WORDS.include?(term) }
  end
  
end
