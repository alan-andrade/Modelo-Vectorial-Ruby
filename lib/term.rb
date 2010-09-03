require 'active_record'

class Term < ActiveRecord::Base  
  primary_key :term
  has_and_belongs_to_many :docs, :join_table=>:has
end
