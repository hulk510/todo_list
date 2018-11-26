class ListsController < ApplicationController
  def index
  	@list = List.new 
  	@lists = List.all 
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

  private

  	def list_params
  		params.require(:list).permit(:title)
  	end

end
