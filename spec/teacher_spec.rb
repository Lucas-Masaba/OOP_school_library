require_relative '../teacher'

describe Teacher do
  context 'Testing Teacher class' do
    before :each do
      @teacher = Teacher.new(40, 'Chidori', name: 'kakashi hatake')
    end

    it 'test if teacher name exists' do
      expect(@teacher.name).to eq('kakashi hatake')
    end

    it 'test if teacher age exists' do
      expect(@teacher.age).to eq(40)
    end

    it 'test if teacher specialization exists' do
      expect(@teacher.specialization).to eq('Chidori')
    end
  end
end
