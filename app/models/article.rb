class Article < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }

  enum status: { draft: 0, published: 1, archived: 2 }

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  
  def self.search(params)
    articles = all # for not existing params args
    if params[:search].present?
      articles = all.where("title like ? OR text LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
    articles
  end
end
