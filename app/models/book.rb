class Book < ApplicationRecord
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  def favorited_by?(user)
#現在ログインしているユーザーによっていいねされてる？
    favorites.exists?(user_id: user.id)
#いいねは存在してる？(いいねを既に押してるか、押していないか)
  end

  validates :title, presence:true
  validates :body, presence:true, length:{maximum:200}

end
