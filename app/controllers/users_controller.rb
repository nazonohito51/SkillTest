# coding: utf-8

class UsersController < ApplicationController

  #一覧画面
  def index
    @users = User.all
  end

  #詳細画面
  def show
    @user = User.find(params[:id])
    @comment = Comment.new
  end

  #新規登録画面
  def new
    @user = User.new
  end

  #変更画面
  def edit
    @user = User.find(params[:id])
  end



  #新規登録実行
  def create
    @user = User.new(params.require(:user).permit(:name, :age, :gender))

    if @user.save
      flash[:notice] = @user.name + 'の登録に成功しました。'
      redirect_to :action => "index"
    else
      render :new
    end
  end

  #変更実行
  def update
    @user = User.find(params[:id])

    if @user.update(params.require(:user).permit(:name, :age, :gender))
      flash[:notice] = @user.name + 'の変更に成功しました。'
      redirect_to :action => "index"
    else
      render :edit
    end
  end

  #削除実行
  def destroy
    @user = User.find(params[:id])

    @user.destroy

    flash[:notice] = @user.name + 'の削除に成功しました。'
    redirect_to :action => "index"
  end

  #コメント新規登録実行
  def create_comment
    @comment = Comment.new(params.require(:comment).permit(:message, :user_id))

    if @comment.save
      flash[:notice] = 'コメントの登録に成功しました。'

      #コメント入力フォームの初期化
      @comment = Comment.new
    else
    end

    @user = User.find(params[:id])

    render :show
  end

  #コメント削除実行
  def destroy_comment
    @comment = Comment.find(params[:comment_id])

    @comment.destroy

    @user = User.find(params[:id])

    #コメント入力フォームの初期化
    @comment = Comment.new

    flash[:notice] = 'コメントの削除に成功しました。'
    render :show
  end
end
