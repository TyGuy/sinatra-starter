require 'sinatra/activerecord'

def database_url
  db_url_hash = Hash.new('DATABASE_URL').merge(
    'test' => 'DATABASE_URL_TEST',
    'development' => 'DATABASE_URL_DEV',
  )

  db_url_key = db_url_hash[ENV['RACK_ENV']]

  ENV[db_url_key]
end

Server.configure :production, :development, :test do
  db = URI.parse(database_url)

  ActiveRecord::Base.establish_connection(
    adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    host: db.host,
    port: db.port,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8',
  )
end
