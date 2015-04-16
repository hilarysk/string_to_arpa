DATABASE = SQLite3::Database.new("/Users/hilarysk/Code/2015-04-15-arpa-gem/database/arpagem.db")

DATABASE.results_as_hash = true
DATABASE.execute( "PRAGMA encoding = \"UTF-16\"" );

DATABASE.execute("CREATE TABLE IF NOT EXISTS phonetics (id INTEGER PRIMARY KEY, word TEXT, arpabet BLOB)")
