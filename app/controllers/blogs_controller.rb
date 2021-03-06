class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
    @blogs = Blog.order(:created_at).reverse_order
  end

  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end


  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
      @blog.user_id = current_user.id

    else
      @blog = Blog.new
      @blog.user_id = current_user.id
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render action: 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを更新しました！"
  end

  def destroy
    if @blog.user_id === current_user.id
      @blog = Blog.find(params[:id])
      @blog.destroy
      redirect_to blogs_path, notice: "ブログを削除しました！"
    else
      redirect_to blogs_path, notice: "削除できません！"
    end
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end



  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
