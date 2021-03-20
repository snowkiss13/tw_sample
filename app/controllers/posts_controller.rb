class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    # 全てのブログを取得する命令
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.create(post_params)
    if @post.save
      # 一覧画面へ遷移しブログ作成しました！のメッセージを表示する
      redirect_to posts_path, notice: "ブログを作成しました！"
    else
      # 入力フォーム再描画
      render :new
    end
  end
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def show
  end
  def edit
  end
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"ブログを削除しました！"
  end
  def confirm
    @post = Post.new(post_params)
  end
  private
  def blog_params
    params.require(:blog).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end