require_relative '../student'
require_relative '../classroom'

describe Student do
  context "Testing Student class" do

    before :each do
      @student = Student.new(15, nil, name: 'naruto')
      @classroom = Classroom.new('Rasengan')
    end

    it 'test if play hooky' do
      expect(@student.play_hooky).to eq("¯\(ツ)/¯")
    end

    it "test if student name exists" do
      expect(@student.name).to eq('naruto')
    end

    it "test if student age exists" do
      expect(@student.age).to eq(15)
    end

    it "test add classroom method" do
      expect(@student.classroom).to be_nil
      @student.add_classroom(@classroom)
      expect(@classroom.students.length).to eq(1)
    end


  end
end