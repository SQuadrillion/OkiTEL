module TwilioHelper

  def get_number()
    require 'net/http'
    require 'json'

    response = Net::HTTP.get(URI.parse('http://150.95.144.72/about_to_connect.xml'))

    if md = response.match(/>\+81([0-9]+)<\//)
      str = md[1]
      return '0' + str[0..1] + '-' + str[2..5] + '-' + str[6..9]
    end

    return ''
  end
end
