class ReservationsController < ApplicationController
  def home
  	@res = Reservation.where(user_id: session[:user_id])
  	@post = Post.where(user_id: session[:user_id])
  end

  def new
  	@post = Post.find_by(id: params[:room_id])
  	@start = Date.parse(params[:start_date])
  	@end = Date.parse(params[:end_date])
  	@total = (@end - @start).to_i
  	@count = params[:count].to_i
  	@price = @post.price.to_i
  	@total_price = @total * @price * @count
  end

  def create
  	@res = Reservation.new(start_date: params[:start_date], end_date: params[:end_date], price: params[:price], room_id: params[:room_id], user_id: params[:user_id], post_name: params[:post_name], post_text: params[:post_text])
    if  @res.save
    	flash[:notice] = "予約が完了しました"
        redirect_to("/reservations/#{@res.room_id}")
    else
    	@post = Post.find_by(id: params[:room_id])
    	flash[:notice] = "編集に失敗しました"
        render("reservations/show")
    end
  end

  def show
  	@res = Reservation.find_by(room_id: params[:id])
  	@post = Post.find_by(id: params[:id])
  	@stime = @res.start_date.strftime("%Y年%m月%d日")
  	@etime = @res.end_date.strftime("%Y年%m月%d日")
  end
end
