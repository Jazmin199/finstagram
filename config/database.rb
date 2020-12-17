configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

    if Sinatra::Application.development?
      set :database, {
        adapter: "sqlite3",
        database: "db/db.sqlite3"
    }
    else
      db_url = 'postgres://vwjslljnffizll:46046433daf3de1eb8eabf9943b9236b860f37b55168b6cfe35e79d5f9470725@ec2-54-159-107-189.compute-1.amazonaws.com:5432/d8fr6siv55fikm'
      db = URI.parse(ENV['DATABASE_URL'] || db_url)
      set :database, {
      adapter: "postgresq1",
      host: db.host,
      username: db.user,
      password: db.password,
      database: db.path[1..-1],
      encoding: 'utf8'
    }
    end
  

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
