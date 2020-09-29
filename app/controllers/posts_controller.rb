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
    post = Post.find(params[:id]) #URLパラメーターから取得した既読メモのidをpostに代入する
    if post.checked#postに代入されたメモの既読の有無を判定するプロパティを指定
      post.update(checked: false)#既読であれば既読の解除のためfalseへ変更
    else
      post.update(checked: true)#既読でなければ既読にするためにtrueに変更する
    end

    item = Post.find(params[:id]) #上記で更新したレコードを取得し直しitemに代入
    render json: { post: item } #JSON形式のデータとしてchecked.jsにレスポンスする。
  end
end
