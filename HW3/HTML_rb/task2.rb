require 'fillson22_make_html'

class Animal

  attr_reader :name
  attr_accessor :sleep

  ARRAY = ['Он просто мило бегает туда-сюда.', 'Ковыряется в траве. Наверно что-то нашёл.',
    'Трётся об Вашу ногу.', 'Засмотрелся куда-то.', 'ВДРУГ!!! Вам кажеться что он что-то бормочет???!!! Фу-х, нет показалось']

  def initialize(name)
    @name = name # имя
    @sleep = false    # состояние сна изначально => не спит
    @full = 10        # полностью сыт
    @fatigue = 0      # усталость
    @age = 5          # возраст
    @health = 10      # здоровье
    puts "#{name} ???!!! Хмм))) странное имя, но ладно #{name} так #{name}"
  end

  def attribute
    <<~HTML
      <h1>Имя - #{@name}</h1>
      <p> Сыт - #{@full} </p>
      <p> Усталость - #{@fatigue}</p>
      <p> Возраст - #{@age} </p>
      <p> Здоровье - #{@health} </p>
      <div style="font-size:5rem;width:100%;text-align:center;">
      #{emodzi}          
    HTML
  end

  # Список возможных действий
  def do_with_me
    if fly?
      puts "
                                        Что-то ещё?
                                        0. !!! Я могу летать !!!
                                        1. Покормить
                                        2. Уложить спать
                                        3. Покупать
                                        4. Лечить #{name}
                                        5. Просто понаблюдать
                                        6. Покидать палку
                                        7. Тренировать команды: Ко мне, Сидеть, Принеси тапки)))
                                        8. Учавствовать в турнире
                                        9. Взять на руки и гладить
                                        10.Разрешить детям поиграть с #{name}
                                        11.Выпить эликсир молодости
                                        12. Exit"
    else
      puts "
                                        Что-то ещё?
                                        1. Покормить
                                        2. Уложить спать
                                        3. Покупать
                                        4. Лечить #{@name}
                                        5. Просто понаблюдать
                                        6. Покидать палку
                                        7. Тренировать команды: Ко мне, Сидеть, Принеси тапки)))
                                        8. Учавствовать в турнире
                                        9. Взять на руки и гладить
                                        10.Разрешить детям поиграть с #{@name}
                                        11.Выпить эликсир молодости
                                        12. Exit"
    end
  end

  def emodzi
    @emodzi = ''
    if @full < 5 || @fatigue > 5 || @health < 5
      @emodzi = '&#128533;'
    else
      @emodzi = '&#128512;'
    end
    if @health <= 0 || @age > 30 || @fatigue > 15 || @full <= 0
      @emodzi = '&#128581;'
    end
    return @emodzi
  end

  def elixir
    puts "#{name} выпивает странную бутылочку и как Бенжамин Баттон молодеет на глазах"
    @age = 1
    PageController.greate(attribute, bypass_html: true)
  end

  # Покупать питомца
  def bathe
    asleep
    fatigue
    puts 'Он плещеться в воде как буд-то он водяной'
    @health += 1
    some_time
    PageController.greate(attribute, bypass_html: true)
  end

  # Поход к доктору
  def treat
    asleep
    fatigue
    puts 'Никто не любит доктора особенно когда он достаёт такой большой шприц'
    @health = 10
    some_time
    PageController.greate(attribute, bypass_html: true)
  end

  # Тренировка
  def train
    health
    asleep
    fatigue
    puts 'Ко мне и Сидеть выполняет хорошо, но тапки сгрызает пока донесёт. Надо поработать ещё...'
    @fatigue += 1
    some_time
    PageController.greate(attribute, bypass_html: true)
  end

  # Соревнование на турнире
  def competition
    asleep
    fatigue
    puts 'Мы победили только в одном конкурсе из 10-ти. И это конкурс Обжора-2022'
    @fatigue += 1
    @full = 10
    some_time
    PageController.greate(attribute, bypass_html: true)
  end

  # Ну как же не подержать на руках
  def iron
    asleep
    puts 'На руках становиться мягким и послушным. Но я то знаю... что притворяется'
    @fatigue -= 5
    some_time
    PageController.greate(attribute, bypass_html: true)
  end

  # Отпустил поиграть с детьми
  def kids
    asleep
    health
    puts 'Наверно, зря я это сделал. Сейчас накормят всякой-всячиной и лечи потом.'
    @health -= 2
    @fatigue -= 1
    some_time
    PageController.greate(attribute, bypass_html: true)
  end

  # Укладываем спать если не спит и будим если уже спит
  def put_to_sleep
    if sleep
      puts "#{name} уже спит. Может что-то другое?"
    else
      puts "Вы укладываете #{name} спать"
      @sleep = true
      @fatigue = 0
      some_time
      PageController.greate(attribute, bypass_html: true)
    end
  end

  # Проверяем на сон, будим и кормим если не сыт
  def eat
    asleep
    if @full == 10
      puts "Вы пытаетесь покормить #{name} но он сытый и крутит носом, отворачиваясь"
    else
      if @full < 5
        p 'Он с радостью набрасывается на еду'
      else
        puts 'Он нехотя но всё же ест, чавкая'
      end
      @full = 10
      @health += 2
    end
    PageController.greate(attribute, bypass_html: true)
  end

  # Игра принеси палку____________________________________
  def stick
    asleep
    fatigue
    puts "Вы кидаете палку и на удивление #{name} приносит её"
    @fatigue += 1
    some_time
    PageController.greate(attribute, bypass_html: true)
  end

  # Особая способность которая появляеться при определённых параметрах
  def super_fly
    asleep
    puts "Это невероятно. Вы подбрасываете #{name} и он летит"
    @fatigue += 1
    some_time
    PageController.greate(attribute, bypass_html: true)
  end

  # Просто наблюдаем за ним. Он производит рандомные действия
  def observe
    asleep
    puts "Вы решили просто понаблюдать за #{name}"
    5.times do
      puts ARRAY.sample
    end
    some_time
    PageController.greate(attribute, bypass_html: true)
  end
  #----------------------------------------------------------------------------------

  private

  # Проверка спит или нет. Если да, то будим)))
  def asleep
    return unless sleep == true
    puts "#{name} спит, но раз такие дела... он просыпется"
    @sleep = false
  end

  def health
    puts "#{name} болен, может лечить у доктора или покупать." if @health.positive? && @health < 3
    return unless @health <= 0

    puts "От болезни #{name} превратился в призрака и Вы уже не контролируетет его"
    exit
  end

  # Проверка на усталость
  def fatigue
    puts "#{name} очень устал, может на руки взять или спать положить" if @fatigue >= 10 && @fatigue <= 15
    return unless @fatigue > 15

    puts "От изнеможения #{name} лежит без движения"
    exit
  end

  # Когда желудок наполовину пуст, появляется лёгкость и способность к полёту))
  def fly?
    @full > 2 && @full <= 5
  end

  # Проверка, голоден или нет?
  def hungry?
    @full <= 2
  end

  # После каждого действия отнимается очко сытости и проводиться проверка на голод
  def some_time
    # Если не кормить убежит к новому хозяину
    if @full.positive?
      @full -= 1
    else
      puts "К сожалению #{name} убежал к новому хозяину"
      exit
    end

    if hungry?
      if sleep
        @sleep = false
        puts "#{name} просыпаеться от урчания в животе"
      else
        puts "#{name} проголодался!"
      end

    end
    if @age > 20 && @age < 30
      puts "Начинает стареть. Возраст у #{name} идёт не так как у людей. Выпейте эликсир"
    elsif @age > 30
      puts "К сожалению #{name} стал настолько стар и мудр что не видит надобности в Вас"
      exit
    end
    @age += 2
  end
end
#========================================================================================
p 'Привет! Как ты меня назовёшь?'
name = gets.chomp
aaa = Animal.new(name)
command = nil
puts 'Вы можете ввести h что бы увидеть список команд'
until command == 'exit'
  command = gets.chomp
  case command
  when 'h'
    aaa.do_with_me
  when '0'
    aaa.super_fly
  when '1'
    aaa.eat
  when '2'
    aaa.put_to_sleep
  when '3'
    aaa.bathe
  when '4'
    aaa.treat
  when '5'
    aaa.observe
  when '6'
    aaa.stick
  when '7'
    aaa.train
  when '8'
    aaa.competition
  when '9'
    aaa.iron
  when '10'
    aaa.kids
  when '11'
    aaa.elixir
  when '12'
    command = 'exit'
  end
end
