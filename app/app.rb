ENV['RACK_ENV'] ||= 'development'

require 'sinatra/flash'
require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/' do
    'hello world'
  end

  get '/links' do
    @links = Link.all
    erb:'links/index'
  end

  get '/links/new' do
    erb:'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end

    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
    password: params[:password],
    confirm_password: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:message] = 'Password and confirmation password do not match'
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
