require 'test_helper'

describe 'Assertions' do
  it 'supports assertions' do
    # The subjects (values being tested)
    singer = 'Michael Buble'
    calculation = 0.3 - 0.2 # = 0.09999999999999998

    # The most basic assertion
    assert singer.end_with?('e')

    # Equality/matching
    assert_equal 'Michael', singer.split.first # expected == actual
    assert_same singer, singer # expected.equal?(actual)
    assert_nil nil
    assert_match /Michael (Buble|Jackson)/, singer # regex =~ singer

    # Containers
    assert_empty "" # obj.empty?
    assert_includes singer, 'Bub' # singer.include?('Bub')

    # Numeric
    assert_in_delta 0.1, calculation    # float comparison (absolute error method)
    assert_in_epsilon 0.1, calculation  # float comparison (relative error method)
    assert_operator calculation, :<, 5  # calculation < 5

    # Types/messages
    assert_instance_of Float, calculation  # calculation.instance_of?(Float)
    assert_kind_of Numeric, calculation    # calculation.kind_of?(Numeric)
    assert_respond_to singer, :downcase    # singer.respond_to?(:downcase)

    # Generic
    assert_predicate calculation, :positive?   # calculation.positive?
    assert_send [singer, :start_with?, 'Mic']  # singer.start_with?('Mic')

    # Exceptions
    error = assert_raises(ZeroDivisionError) { 5 / 0 }
    assert_equal error.message, 'divided by 0'

    # Output
    assert_output("0.09999999999999998\n") { puts calculation }
    assert_silent { "nothing output to $stdout or $stderr" }

    # Refute (opposite of assert)
    refute singer.end_with?('Jackson')
    refute_empty singer
    refute_equal singer, 'Lady Gaga'
    refute_in_delta calculation, 3.14
    refute_in_epsilon calculation, 3.14
    refute_includes singer, 'z'
    refute_instance_of Numeric, calculation
    refute_kind_of Integer, calculation
    refute_match /Gaga/, singer
    refute_nil singer
    refute_operator calculation, :>, 3.14
    refute_predicate singer, :empty?
    refute_respond_to singer, :sing
    refute_same singer, 'Michael Buble'

    String.stub_any_instance(:length, 42) do
      assert_equal "hello".length, 42
    end
    @mock = Minitest::Mock.new
    @mock.expect(:meaning_of_life, 42)
    @mock.meaning_of_life # => 42

    @mock.expect(:do_something_with, true, [{ }, true])
    @mock.do_something_with({ }, true) # => true
    # flunk "You shall not pass"

    assert @mock.verify

    @obj = Object.new
    assert @obj.tainted?
  end
end
