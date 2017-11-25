class Register < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, format: { with: /0\d{1,4}-\d{1,4}-\d{4}/, 
                                              message: '電話番号を入力してね(ハイフンも)' }
  validates :time, presence: true
  validates :todo, presence: true

  def self.time_range
   ary = Array.new
   35.times{ |i| ary << i if i % 5 == 0  }
   ary
  end
end
