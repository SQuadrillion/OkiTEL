module RegistersHelper


  def process_datetime datetime
    # 2017-11-25 10:45:00 UTC
    current_time = Time.now

    if datetime.year == current_time.year && datetime.month == current_time.month && datetime.day == current_time.day
      return_data = "今日の#{datetime.hour}時#{datetime.min}分"
    else
      return_data = "#{datetime.year}年#{datetime.month}月#{datetime.day}日の#{datetime.hour}時#{datetime.min}分"
    end

    return_data
  end


  def set_number(number)
    require 'net/http'
    require 'json'
    number.gsub!(/-/, '')
    response = Net::HTTP.get(URI.parse('http://150.95.144.72/change_number.php?number=' + number.to_s))
    "tel:+815031843987"
  end
end
