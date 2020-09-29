class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC") #メモを降順で表示
  end  
  
  def create
    Post.create(content: params[:content])
    redirect_to action: :index #メモを保存した後はトップページへリダイレクトする
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
