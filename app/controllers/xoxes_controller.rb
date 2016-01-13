class XoxesController < ActionController::Base


def turncheck
    @turn = Xox.moves.even?
  end

  def move
    @xox = Xox.find(params[:id])
    @xox.move(params[:cell].to_i)
    redirect_to xox_path(params[:id])
   
  end

  def index
    @xoes = Xox.all
  end  

  def new
    @xox = Xox.new
  end 
  
  def edit
    @xox = Xox.find(params[:id])
  end

  def show
    @xox = Xox.find(params[:id])
  end   

  def create
    xox = Xox.create(xox_params)
  end
  
  def update
    pry
    # xox = Xox.find(params[:id])
    # xox.update(xox_params)
  end  

  def show
    @xox = Xox.find(params[:id])
  end  

  def destroy
    xox = Xox.find(params[:id])
    xox.destroy
  end  

  
    

  private

  def xox_params
    params.require(:xox).permit(:matches, :moves,:winner,:gamestate)
  end  
end