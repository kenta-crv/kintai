class ManagementsController < ApplicationController
  def index
  	 @managements = Management.all.order(created_at: 'desc')
  end
  
  def show
  	@management = Management.find_by(id: params[:id])
  end
  
  def new 
    @management = Management.new
  end
 
 def create
    # render plain: params[:post].inspect
    # save
    # @post = Post.new(params[:post])
    # @post = Post.new(params.require(:post).permit(:title, :body))
    @management = Management.new(management_params)
    if @management.save
        # redirect
        redirect_to managements_path
    else
        render 'new'
    end
  end
  
  def edit
    @management = Management.find(params[:id])
  end

 def update
    @management = Management.find(params[:id])
     if @management.update(management_params)
        redirect_to managements_path
    else
        render 'edit'
    end      
 end
 
 def destroy
    @management = Management.find(params[:id])
    @management.destroy
    redirect_to managements_path
 end

  private
    def management_params
      params.require(:management).permit( 
      :company, #会社名
      :company_short, #略称
      :first_name, #代表者姓
      :last_name, #代表者名
      :first_kana, #ミョウジ
      :last_kana, #ナマエ
      :tel, #電話番号
      :fax,  #FAX番号
      :e_mail,  #メールアドレス
      :postnumber,   #郵便番号
      :address, #住所
      :capital, #資本金
      :labor_number,   #労働保険番号        
      :employment_number #労働保険番号  
       )
    end    

end
