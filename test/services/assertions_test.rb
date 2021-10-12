require 'test_helper'

describe Array do
  subject { 1..10 }
  it 'should have correct length' do
    expect(subject.size).must_equal 10
  end
end
