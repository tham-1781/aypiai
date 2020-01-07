require 'calculator'

RSpec.describe Calculator do
  # - describe "ClasName" do end;
  # - describe "#instance_method" do end;
  # - describe ".class_method" do end;

  describe '#sum' do
    it 'return sum of 2 numbers' do
      calc = Calculator.new
      result = calc.sum(1, 2)
      expect(result).to eq(3)
    end

    let(:foo) do
      puts "define foo variable"
      "cute dog"
    end

    it "memoizes the value" do
      expect(foo).to eq("cute dog")
      expect(foo).to eq("cute dog")
    end

    it "is not cached across examples" do
      expect(foo).to eq("cute dog")
    end
  end

  # context
  describe "#div" do
    it 'should return message "cant divide by zero" if b is 0' do
      calc = Calculator.new
      result = calc.div(1, 0)
      expect(result).to eq "cant divide by zero"
    end

    it 'should return quotient of 2 numbers' do
      calc = Calculator.new
      result = calc.div(10, 2)
      expect(result).to eq 5
    end
  end

  # let
  describe "let method" do
    let(:foo) do
      puts "define foo variable"
      "cute dog"
    end

    it "has expected result" do
      puts "begin it block"
      expect(foo).to eq("cute dog")
    end
  end

  #let!
  describe "let! method" do
    let!(:foo) do
      puts "define foo variable"
      "cute dog"
    end

    it "has expected result" do
      puts "begin it block"
      expect(foo).to eq("cute dog")
    end
  end

  # stub method
  # allow(book).to receive(:title).and_return("The RSpec book")

  #   allow(book).to receive_messages(
  #     title: "The RSpec book",
  #     description: "Write tests use method stubs"
  #  )

  # allow(book).to receive_message_chain("title.length") { 30 }
end
