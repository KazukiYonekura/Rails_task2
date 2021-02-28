class UsersController < ApplicationController
  def sign_up
  end

  def create
  	@user = User.new(name: params[:name], email: params[:email], password: params[:password], rpassword: params[:rpassword], image_name: "default_icon-9263.jpg")
  	if @user.password == @user.rpassword && @user.save
  		session[:user_id] = @user.id
  		flash[:notice] = "ユーザー登録が完了しました"
  		redirect_to("/")
  	elsif @user.password != @user.rpassword
  		flash[:notice] = "パスワードが一致していません"
  		render("users/sign_up")
  	else
  		render("users/sign_up")
  	end
  end

  def sign_in
  end

  def profile
  	@user = User.find_by(id: session[:user_id])
  end

  def profile_update
  	@user = User.find_by(id: session[:user_id])
  	if  params[:image_name]
  	    @user.image_name = "#{@user.id}.jpg"
  	    image = params[:image_name]
  	    File.binwrite("public/user_images/#{@user.image_name}",image.read)
  	end
  	@user.name = params[:name]
  	@user.text = params[:text]
  	if @user.save
  	    flash[:notice] = "ユーザー情報を編集しました"
	      redirect_to("/users/profile")
	  else
		    flash[:notice] = "編集に失敗しました"
		    render("users/profile")
	  end
  end

  def account
  	@user = User.find_by(id: session[:user_id])
  end

  def login
  	@user = User.find_by(email: params[:email], password: params[:password])
  	if @user
  		session[:user_id] = @user.id
  		flash[:notice] = "ログインしました"
  		redirect_to("/")
  	else
  		@email = params[:email]
  		@password = params[:password]
  		render("users/sign_in")
  	end
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = "ログアウトしました"
  	redirect_to("/users/sign_in")
  end

  def edit
  end

  def update
  	@user = User.find_by(id: session[:user_id])
    if  params[:change_password] == params[:change_rpassword] && params[:change_password].present?
	    @user.password = params[:change_password]
    end
	    @user.email = params[:email]
    if  @user.save
	    flash[:notice] = "ユーザー情報を編集しました"
	    redirect_to("/users/account")
    else
	    flash[:notice] = "編集に失敗しました"
	    render("users/edit")
    end
  end

end
