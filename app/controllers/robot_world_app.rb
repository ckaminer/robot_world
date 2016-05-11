require 'models/robot_repository'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_repository.all
    erb :index
  end

  def robot_repository
    database = YAML::Store.new('db/robot_repository')
    @robot_repository ||= RobotRepository.new(database)
  end

end
