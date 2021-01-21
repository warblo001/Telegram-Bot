# Module for Telegram bot functions
module Choices
  def option(pick, playlist)
    slct = pick
    playlist[slct]
  end

  def choice(message, selection)
    selection.find do |x|
      x.chomp if message == x
    end
  end
end
