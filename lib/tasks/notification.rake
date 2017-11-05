namespace :notification do
  desc "TODO"
  task normal: :environment do
    Notification.to_notify.each do |notify|
      time = (notify.dead_line - Date.current).to_i
      unless notify.finished
        case time
          when 30
            NotificationMailer.notify(User.first, message: notify.message, time:30)
          when 14
            NotificationMailer.notify(User.first, message: notify.message, time:14)
            SmsService.send_sms(notify.message, 14)
          when 3
            NotificationMailer.notify(User.first, message: notify.message, time:3)
          when 1
            NotificationMailer.notify(User.first, message: notify.message, time:1)
            SmsService.send_sms(notify.message, 1)
          when 0
            NotificationMailer.notify(User.first, message: notify.message, time:0)
            SmsService.send_sms(notify.message, 0)
        end
      end
    end
  end

end
