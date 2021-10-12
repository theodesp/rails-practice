require 'test_helper'

describe UserDevice do
  it 'should use NotificationAdapter for notifications' do
    device = UserDevice.new

    # create mock adapter, that says 'ohai!' on notify
    mock_adapter = MiniTest::Mock.new
    mock_adapter.expect :notify, 'ohai!'

    # connect our mock, so next NotificationAdapter.new call will return our mock
    # and not usual implementation
    NotificationAdapter.stub :new, mock_adapter do
      expect(device.notify).must_equal 'ohai!'
    end
    Time.stub :now, Time.at(0) do   # stub goes away once the block is done
      assert_equal Time.now, '1970-01-01 01:00:00'.to_time, "Invalid time"
    end
    mock_adapter.verify
  end
end
