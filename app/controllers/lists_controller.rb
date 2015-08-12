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


      private

        def set_list
          @list = List.find(params[:id])
        end

        def list_params
          params.require(:list).permit(:title, :description)
        end

end
