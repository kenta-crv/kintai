class WorkersController < ApplicationController

  def index
  	 @workers = Worker.all.order(created_at: 'desc')
  end
  
  def show
  	@worker = Worker.find_by(id: params[:id])
  end
  
  def new 
  end
 
 def create
     # render plain: params[:post].inspect
    # save
    # @post = Post.new(params[:post])
    # @post = Post.new(params.require(:post).permit(:title, :body))
    @workers = Worker.new(worker_params)
    if @workers.save
        # redirect
        redirect_to workers_path
    else
        render 'new'
    end
  end
  
  def edit
    @workers = Worker.find(params[:id])
  end

 def update
    @workers = Worker.find(params[:id])
     if @workers.update(worker_params)
        redirect_to workers_path
    else
        render 'edit'
    end      
 end
 
 def destroy
    @workers = Worker.find(params[:id])
    @workers.destroy
    redirect_to workers_path
 end

  private
    def worker_params
      params.require(:worker).permit(
      :first_name,
      :last_name,
      :tel,
      :e_mail,
      :post_number,
      :address,
      :birthday,
      :classification,
      :authority,
      :hire_date,
      :departure_date,
      :affiliation
      )
    end    

end
