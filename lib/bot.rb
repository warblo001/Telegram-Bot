# rubocop:disable Metrics/CyclomaticComplexity

require 'telegram/bot'
require_relative 'choices'
# Bot main class
class Bot
  include Choices

  def initialize
    @token = '1306468071:AAHVxgz0mhrWSUvaqEUj3Y25lfJG9xhMIc0'
    @chat_id = 'Alan'
    @playlist = {
      '0' => 'Top 500 classic Rock songs',
      '1' => 'Alternative rock of the 2000s',
      '2' => 'Classic Rock Greatest Hits',
      '3' => 'Modern Rock Hits',
      '4' => 'Late 90s/Early 2000s Rock Playlist'
    }

    @play_link = {
      'Top 500 classic Rock songs' => 'https://youtube.com/playlist?list=PLNxOe-buLm6cz8UQ-hyG1nm3RTNBUBv3K',
      'Alternative rock of the 2000s' => 'https://youtube.com/playlist?list=PL6Lt9p1lIRZ311J9ZHuzkR5A3xesae2pk',
      'Classic Rock Greatest Hits' => 'https://www.youtube.com/watch?v=v0Bu3M4r4K4',
      'Modern Rock Hits' => 'https://youtube.com/playlist?list=RDCLAK5uy_l3PeyHeqJh1dR78WjfsMJwRHJx9ofMvvc',
      'Late 90s/Early 2000s Rock Playlist' => 'https://youtube.com/playlist?list=PLI1gW6hB0ahz9iGkYKld6Mtfa-VD1Pqun'
    }

    @artists = {
      '0' => "60's",
      '1' => "70's",
      '2' => "80's",
      '3' => "90's",
      '4' => '2k+'
    }

    @artist_pick = {
      "60's" => 'The Beatles, Bob Dylan, Elvis Presley, The Beach Boys and The Rolling Stones.',
      "70's" => 'Led Zeppelin, Stevie Wonder, Pink Floyd, Queen, David Bowie and KISS.',
      "80's" => 'Michael Jackson, AC/DC, Van Halen, The Police, and Guns N’ Roses.',
      "90's" => 'Nirvana, Red Hot Chili Peppers, Pearl Jam, Metallica and Tool.',
      '2k+' => 'Radiohead, System of a Down, Foo Fighters, Gorillaz and Linkin Park.'
    }
  end

  def bot_functions
    intro = "\n Choose: \n Playlist -> Get a ROCK playlist! \n Artist -> Get a list of Artists! \n Or \n Surprise!"
    gods1 = "\n Queen\n Earth, Wind & Fire\n Michael Jackson\n Guns N’ Roses"
    gods2 = "\n Red Hot Chili Peppers\n Metallica\n System of a Down\n Foo Fighters"

    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        response1 = choice(message.text, @play_link.keys)
        response2 = choice(message.text, @artist_pick.keys)
        pl_choice = option(response1, @play_link)
        music = option(response2, @artist_pick)
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Heyyaa , #{message.from.first_name}, let's rock!" + intro)
        when 'Playlist'
          bot.api.send_message(chat_id: message.chat.id, text: "Choose one, rookie! #{@play_link.keys}")
        when 'Artist'
          bot.api.send_message(chat_id: message.chat.id, text: "Choose a year!!, #{message.from.first_name}!")
          bot.api.send_message(chat_id: message.chat.id, text: @artist_pick.keys.to_s)
        when 'Surprise!'
          bot.api.send_message(chat_id: message.chat.id, text: "Some of the best! #{gods1}#{gods2}.")
        when response1.to_s
          bot.api.send_message(chat_id: message.chat.id, text: "Here you go! |..| (#{pl_choice})")
        when response2.to_s
          bot.api.send_message(chat_id: message.chat.id, text: "Check this out! #{music} ")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "See you in the moshpit, #{message.from.first_name}!")
        else
          bot.api.send_message(chat_id: message.chat.id, text: "Santana won\'t approve, type one option and keep Rocking!")
        end
      end
    end
  end
end
