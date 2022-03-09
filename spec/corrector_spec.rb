require_relative '../corrector'

describe Corrector do
  context 'Testing Corrector class' do
    before :each do
      @corrector = Corrector.new
    end

    it 'test if correct_name method would capitalize first letter' do
      name = 'tanjiro'
      expect(@corrector.correct_name(name)).to eq('Tanjiro')
    end

    it 'test if correct_name method would cut the length of a name if it exceeds 10 characters' do
      name = 'muzan kibutsuji'
      expect(@corrector.correct_name(name)).to eq('Muzan Kibut')
    end
  end
end
