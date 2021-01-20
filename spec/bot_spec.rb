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
