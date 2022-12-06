class Animal
  attr_accessor :food, :water, :energy, :sleep
  attr_reader :name

  def initialize(name)
    @name = name
    @food = 10
    @water = 10
    @energy = 10
    @sleep = false
  end

  def eat #================================
    @food += 1
  end

  def drink #==============================
    @water += 1
  end

  def go_sleep
    @energy = 10
    @food -= 2
    @water -= 2
  end

  def go_walk #============================
    @water -= 1
    @food -= 1
    @energy -= 1
  end

  def go_train #============================
    @water -=1
    @food -= 1
    @energy -= 1
  end

  def stop_game?
    @energy <= 0 || @food <= 0 || @water <= 0
  end

  def current_food_water #========================
    if food <= 2 || water <= 2
      "Я голоден или меня мучает жажда"
    elsif
      food > 10 || water > 10
      'Осторожно. Я лопну! Нужно погулять'
    end
  end

  def current_energy
    "Я устал. Нужно поспать" if energy <= 2
  end

end