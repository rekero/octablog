class Post < ActiveRecord::Base
  after_create :set_rating

  def set_rating
    self.rating = rand(1..5)
    self.save
  end

  def self.by_rating(min, max)
    if min.present? && max.present?
      where(rating: (min.to_i..max.to_i))
    else
      all
    end
  end

  def self.by_author(author)
    if author.present?
      where('author LIKE ?', "%#{author}%")
    else
      all
    end
  end

  def self.by_category(category)
    if category.present?
      where('category LIKE ?', "%#{category}%")
    else
      all
    end
  end

  def self.by_date(date)
    if date.present?
      where(date: date.to_date)
    else
      all
    end
  end

end
