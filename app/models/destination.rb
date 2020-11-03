class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts


    def recent_posts
        self.posts.max(5){|post| post.created_at}
    end

    def featured_post
         self.posts.max_by{|post| post.likes}
    end
    
    def avg_age
        total = self.bloggers.sum{|blogger|blogger.age}
        total / self.bloggers.count
    end
end
