module NotificationsHelper
  def posted_time(time)
    time > Date.today ? "#{time_ago_in_words(time)}" : time.strftime('%m月%d日')
  end

  def test(notice)
    if notice.read == true
      "既読"
    else
      "未読"
    end


  end


end
