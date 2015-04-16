require_relative 'minitest_helper'

require 'minitest/autorun'

class TestStringToArpa < Minitest::Test
  DATABASE = SQLite3::Database.new("arpagem.db")

  DATABASE.results_as_hash = true
  DATABASE.execute( "PRAGMA encoding = \"UTF-16\"" );
  
  def test_that_it_has_a_version_number
    refute_nil ::StringToArpa::VERSION
  end
  
  def test_return_on_string_in_database
    assert_equal("fish".to_arpa, "F IH1 SH")
  end
  
  def test_return_on_string_not_in_database
    assert_equal("asdfsdf".to_arpa, "asdfsdf")
  end
end
