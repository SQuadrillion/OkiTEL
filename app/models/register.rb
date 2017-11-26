class Register < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, format: { with: /0\d{1,4}-\d{1,4}-\d{4}/,
                                              message: '電話番号を入力してね' }
  validates :time, presence: true
  validates :todo, presence: true

  # データ追加時に実行
  after_save do
    puts("[callback] after_save called")
    BroadcastRegisterJob.perform_later(self, false)
  end

  # データ削除時に実行
  after_destroy do
    puts("[callback] after_destroy called")
    BroadcastRegisterJob.perform_later(self, true)
  end

  def self.time_range
   ary = Array.new
   35.times{ |i| ary << i if i % 5 == 0  }
   ary
  end

  def self.return_to_id_and_time
    registers = self.all
    data = []

    # js datetime format memo 2009/08/11 08:14:45
    registers.each do |register|
      data << {
        id: register.id,
        time: register.time.strftime("%Y/%m/%d %H:%M:00")
      }
    end

    data
  end
end
