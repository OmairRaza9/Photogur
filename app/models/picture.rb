class Picture < ActiveRecord::Base

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_in(year)
    Picture.where("created_at >= ? and created_at < ?", Time.new(year), Time.new(year+1))
  end

  #what I want Time.new(year,month,day)

end
