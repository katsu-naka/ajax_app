class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC") #メモを降順で表示
  end  
  
  def create
    Post.create(content: params[:content])
    redirect_to action: :index #メモを保存した後はトップページへリダイレクトする
  end

end
