require 'active_record'

class Has < ActiveRecord::Base
  
  belongs_to :docs
  belongs_to :terms, :foreign_key=>'terms'
end
