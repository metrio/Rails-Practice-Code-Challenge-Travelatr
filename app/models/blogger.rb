class Blogger < ApplicationRecord
    has_many :posts
    has_many :desinations, through: :posts

    validates :age, numericality: {greater_than: 0}
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}


    def all_likes
        self.posts.sum {|post| post.likes}
    end

    def featured_post
        self.posts.max_by {|post| post.likes}
    end
    
end
