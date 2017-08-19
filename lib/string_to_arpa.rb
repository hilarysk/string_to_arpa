require "string_to_arpa/version"
require "sqlite3"

module StringToArpa
  DATABASE = SQLite3::Database.new(File.join(File.expand_path(File.dirname(__FILE__)), "..", "arpagem.db")

  DATABASE.results_as_hash = true
  DATABASE.execute( "PRAGMA encoding = \"UTF-16\"" );
  
  class Phonetic
    attr_accessor :word, :arpabet
    attr_reader :id
  
    def initialize(options)
      @word = options["word"]
      @arpabet = options["arpabet"]
      @id = options["id"]
    end
  
    def insert
      DATABASE.execute("INSERT INTO phonetics (word, arpabet) VALUES (?, ?)", @word, @arpabet)
      @id = DATABASE.last_insert_row_id
    end
  
    def save      
      attributes = []
                                                                                 
      instance_variables.each do |i|                                               
        attributes << i.to_s.delete("@")                                           
      end     
                                                                         
                                                                                 
      query_hash = {}                                                 
                                                                                 
      attributes.each do |a|        #each with object                                               
        value = self.send(a)
        query_hash[a] = value                                                       
      end                                                                

      query_hash.each do |key, value|
        DATABASE.execute("UPDATE phonetics SET #{key} = ? WHERE id = #{@id}", value)
      end                                                                          
    end
  
    def delete
      DATABASE.execute("DELETE FROM phonetics WHERE id = #{@id}")
    end
  
  
    def self.find(s_id)
      result = DATABASE.execute("SELECT * FROM phonetics WHERE id = #{s_id}")[0]
    
      self.new(result)
    end
  end
end

class String
  def to_arpa
    arpabet = StringToArpa::DATABASE.execute("SELECT arpabet from phonetics where word = ?", self.upcase)
    
    if arpabet == []
      return self
    else
      return arpabet[0]["arpabet"]
    end
  
  end

end
