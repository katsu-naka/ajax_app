class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC") #メモを降順で表示
  end  
  
  def create
    post = Post.create(content: params[:content],checked: false)
    render json:{ post: post}
  end
  #既読操作を行った時に実行されるアクション
  def checked
    post = Post.find(params[:id])
    if post.checked 
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
