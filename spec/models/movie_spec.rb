require 'rails_helper'

RSpec.describe Movie, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

  subject { Movie.new(title: "3 idiots", director: 'falano', rate: 9 )}

  before { subject.save}

  it 'title should be present' do
    subject.title = nil 
    expect(subject).to_not be_valid   
  end

  it 'director should be present' do
    subject.director = nil 
    expect(subject).to_not be_valid   
  end

  it 'title should not be too short' do
    # subject.title= 'text' * 20
    subject.title= 'a'

    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title= 'text' * 200
    # subject.title= 'a'
    expect(subject).to_not be_valid
  end

  it 'director should not be too short' do
    subject.director = 'd'
    expect(subject).to_not be_valid
  end

  it 'director should not be too long' do
    subject.director = 'dr' * 40
    expect(subject).to_not be_valid
  end


  it 'rate should be present' do
    subject.rate = nil 
    expect(subject).to_not be_valid   
  end  

  it 'rate should be integer' do
    subject.rate = "s"
    expect(subject).to_not be_valid
  end

  # it 'rate should be between 1 and 10' do
  #   subject.rate = 99
  #   expect(subject).to_not be_valid
  # end 

  it 'rate should be between 1 and 10' do
    subject.rate = 9
    expect(subject).to be_valid
  end 

end
