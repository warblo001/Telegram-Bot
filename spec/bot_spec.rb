require_relative '../lib/bot'

RSpec.describe Telegram::Bot do
  it 'Works properly' do
    expect(described_class).to be
  end
end

describe Bot do
  it 'Puts hash keys when "Playlist" word is received' do
    expect(@play_link).not_to eql(['Top 500 classic Rock songs', 'Modern Rock Hits', 'Late 90s/Early 2000s Rock Playlist'])
  end
end

describe Choices do
  it 'Returns the playlist of the choice' do
    thebot = Bot.new
    thebot.extend(Choices)
    expect(thebot.choice('Top 500 classic Rock songs',
                         ['Top 500 classic Rock songs', 'Alternative rock of the 2000s'])).to eql('Top 500 classic Rock songs')
  end
end

describe Choices do
  it 'Will return Nil if the selection does not match' do
    thebot = Bot.new
    thebot.extend(Choices)
    expect(thebot.choice('top 500', ['Top 500 classic Rock songs', 'Alternative rock of the 2000s'])).to eql(nil)
  end
end
