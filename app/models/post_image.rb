class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  # userモデルのidと、favoritesモデルのuser_idが同じであれば、trueを返すメソッド →違うかも
  # ここでのuser引数は、単なる定義であり、userモデルのというわけではない？
  
end
