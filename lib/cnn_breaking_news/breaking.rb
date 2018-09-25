class CNNBreakingNews::Breaking

@@all = []

attr_accessor :title, :url

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find(input)
    self.all[input.to_i - 1]
  end
end
