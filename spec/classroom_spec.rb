require_relative '../student'
require_relative '../classroom'

describe Classroom do
  context 'Testing Classroom class' do
    before :each do
      @student = Student.new(15, nil, name: 'naruto')
      @classroom = Classroom.new('Rasengan')
    end

    it 'test if classroom exists' do
      expect(@classroom.label).to eq('Rasengan')
    end

    it 'test add classroom method' do
      expect(@classroom.students.length).to eq(0)
      @classroom.add_student(@student)
      expect(@classroom.students.length).to eq(1)
    end
  end
end
