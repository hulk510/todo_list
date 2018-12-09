class ListsController < ApplicationController
  def index
  	@list = List.new 
  	@lists = List.includes(:tasks).order("tasks.created_at desc")

  end

  def new 
  	@list = List.new 
  end

  def show
  	@list = List.find(params[:id])
  end

  def create
  	@list = List.new(list_params)
  	if @list.save
  		flash[:success] = "新しいToDoリストが作成されました"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  end


  def destroy
  end

  def todolist_search
  end

  def search
    @lists = List.where('title LIKE(?)', "%#{params[:keyword]}%"), Task.where('title LIKE(?)', "%#{params[:keyword]}%")
    render json:  @lists
  end

  private

  	def list_params
  		params.require(:list).permit(:title)
  	end

end
