module ConsumablesHelper
  def calculate_rate(ratings)
    counts = ratings.count
    rating = counts == 0 ? 0 : (ratings.sum(:rating) / counts)
  end
end
