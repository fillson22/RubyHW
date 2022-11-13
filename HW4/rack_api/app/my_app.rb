require_relative 'animal'
require "erb"

class MyApp
  attr_reader :request, :path
  attr_accessor :pet

  def call(env)
    @request = Rack::Request.new(env)
    @path = request.path
    response.finish
  end

  def response
    case path
    when '/'
      rack_response('index.html.erb')
    when '/create_pet'
      name = request.params['name']
      return rack_response_redirect if name.nil? || name.length.zero?
      @pet = Animal.new(name)
      rack_response_redirect('/game')
    when '/game'
      return rack_response_redirect if pet.nil?
      rack_response('game.html.erb')
    when '/food'
      return rack_response_redirect if pet.nil?
      if pet.stop_game?
        rack_response_redirect('/game_over')
      else
        pet.eat
        rack_response('game.html.erb')
      end
    when '/water'
      return rack_response_redirect if pet.nil?
      if pet.stop_game?
        rack_response_redirect('/game_over')
      else
        pet.drink
        rack_response('game.html.erb')
      end
    when '/sleep'
      return rack_response_redirect if pet.nil?
      if pet.stop_game?
        rack_response_redirect('/game_over')
      else
        pet.go_sleep
        rack_response('game.html.erb')
      end      
    when '/walk'
      return rack_response_redirect if pet.nil?
      if pet.stop_game?
        rack_response_redirect('/game_over')
      else
        pet.go_walk
        rack_response('game.html.erb')
      end
    when '/train'
      return rack_response_redirect if pet.nil?
      if pet.stop_game?
        rack_response_redirect('/game_over')
      else
        pet.go_train
        rack_response('game.html.erb')
      end      
    when '/game_over'
      @pet = nil
      rack_response('game_over.html.erb')
    else
      rack_response_redirect
    end
  end

  def rack_response(filename)
    Rack::Response.new(render(filename))
  end

  def render(filename)
    ERB.new(File.read("./views/#{filename}")).result(binding)
  end

  def rack_response_redirect(new_path = '/')
    Rack::Response.new do |response|
      response.redirect(new_path)
    end
  end
end