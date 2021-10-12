class UserDevice
  def notification_adapter
    @notification_adapter ||= NotificationAdapter.new(self)
  end

  def notify
    notification_adapter.notify
  end
end
