module UsersHelper

  def rating_average(ratings)
    sum = 0
    arratings = []
    ratings.each do |rating|
      arratings << rating.score
    end  
    arratings.each do |rating|
      sum += rating
    end
    divisor = arratings.length
    average = sum.to_f / divisor.to_f
  end
end
