class PostsController < ApplicationController
   
   def index
    @posts = Post.all
   end
    
   def show
    @post = Post.find(params[:id])
   end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(params.require(:post).permit(:title, :content, :blogger_id, :destination_id))
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:post_errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def like
        @post = Post.find(params[:id])
        @post.likes +=1
        @post.save
        redirect_to post_path(@post)
    end


    
end