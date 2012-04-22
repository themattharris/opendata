class ActiveRecord::Base
  def self.find_random(number)
    total = count
    number = number > total ? total : number
    # -1 +1 to avoid 0's
    ids = (number*10).times.map{rand(total-1)+1}.uniq[0..number]
    find(ids)
  end
end