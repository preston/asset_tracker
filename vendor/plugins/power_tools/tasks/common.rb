require 'yaml'

def load_database_yml(env)
  dbc = YAML.load(File.open("config/database.yml"))[env]
  user = dbc['username']
  pass = dbc['password']
  host = dbc['host']
  dbname = dbc['database']
  [host, dbname, user, pass]
end