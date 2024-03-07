class Book < ApplicationRecord
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  def favorited_by?(user)
#現在ログインしているユーザーによっていいねされてる？
    favorites.exists?(user_id: user.id)
#いいねは存在してる？(いいねを既に押してるか、押していないか)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%' + content)
    else
      Book.where('title LIKE ?', '%' + content + '%')
    end
  end
  
  scope :latest, -> { order(created_at: :desc) }
  scope :star_count, -> {order(star: :desc)}

  validates :title, presence:true
  validates :body, presence:true, length:{maximum:200}

end
