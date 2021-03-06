class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List created successfully"
      redirect_to lists_path
    else
      flash[:errors] = list.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @list
  end

  def edit
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      flash[:notice] = "List updated successfully"
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    flash[:notice] = "List deleted successfully"
    redirect_to root_path
  end


      private

        def set_list
          @list = List.find(params[:id])
        end

        def list_params
          params.require(:list).permit(:title, :description)
        end

end
