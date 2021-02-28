class PostsController < ApplicationController

  def new
  end

  def sign_in
  end

  def create
    @post = Post.new(name: params[:name], eria: params[:eria], price: params[:price], text: params[:text], user_id: @current_user.id)
    if  @post.save
      if  params[:image]
          @post.image = "#{@post.id}.jpg"
          image = params[:image]
          File.binwrite("public/post_images/#{@post.image}",image.read)
      end
          flash[:notice] = "ユーザー情報を編集しました"
          redirect_to("/posts/#{@post.id}")
    else
        flash[:notice] = "編集に失敗しました"
        render("posts/new")
    end
  end

  def search
  	if params[:area].present? && params[:keyword].present?
  	  @search_key = Post.none
  	elsif params[:area].present?
  	  @search_key = Post.where('name LIKE ? OR eria LIKE ?', "%#{params[:area]}%","%#{params[:area]}%")
  	elsif params[:keyword].present?
  	  @search_key = Post.where('name LIKE ? OR eria LIKE ?', "%#{params[:keyword]}%","%#{params[:keyword]}%")
  	else
  	  @search_key = Post.none
  	end
  	  @count = @search_key.count
  end

  def posts
    @post = Post.where(user_id: session[:user_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

end
