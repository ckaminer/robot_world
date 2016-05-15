class RobotWorldApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_world.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_world.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    @robots = robot_world.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_world.destroy(id.to_i)
    redirect '/robots'
  end

  get '/robots/analytics' do
    @data = robot_world.average_robot_age
    erb :analytics
  end

  def robot_world
    if ENV['RACK_ENV'] == 'test'
      database = Sequel.postgres('robot_world_test')
    else
      database = Sequel.postgres('robot_world')
    end
    @robot_world ||= RobotWorld.new(database)
  end

end
