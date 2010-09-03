require 'active_record'

 ActiveRecord::Base.establish_connection(  
 :adapter => "mysql",  
 :host => "localhost",  
 :database => "RI",
 :user  =>  "root",
 :password => "nuevonegocio"
 )

class DocTable < ActiveRecord::Migration
    
  def self.up
    create_table :docs,:force=>true  do |t|
      t.string :w
    end
  end

  def self.down
    drop_table :docs
  end
    
end

class HasTable < ActiveRecord::Migration
  def self.up
    create_table  :has, :id=>false, :force=>true  do |t|
      t.string :term
      t.string :tf
      t.integer :doc_id
    end      
  end
  
  def self.down
    drop_table :has
  end
end

class TermTable < ActiveRecord::Migration 
  def self.up
    create_table :terms, :id=>false, :force=>true do |t|
      t.string :term
      t.string :idf
    end
  end
  
  def self.down
    drop_table :term
  end
end

DocTable.up
HasTable.up
TermTable.up

