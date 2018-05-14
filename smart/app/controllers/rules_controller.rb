class RulesController < ApplicationController

	
  def index
  	 @rules = Rule.all.order(created_at: 'desc')
  end
  
  def show
  	@rule = Rule.find_by(id: params[:id])
  end
  
  def new 
    @rule = Rule.new
  end
 
 def create
    # render plain: params[:post].inspect
    # save
    # @post = Post.new(params[:post])
    # @post = Post.new(params.require(:post).permit(:title, :body))
    @rule = Rule.new(rule_params)
    if @rule.save
        # redirect
        redirect_to rules_path
    else
        render 'new'
    end
  end
  
  def edit
    @rule = Rule.find(params[:id])
  end

 def update
    @rule = Rule.find(params[:id])
     if @rule.update(rule_params)
        redirect_to rules_path
    else
        render 'edit'
    end      
 end
 
 def destroy
    @rule = Rule.find(params[:id])
    @rule.destroy
    redirect_to rules_path
 end

  private
    def rule_params
      params.require(:rule).permit(
      :try, #試用期間
      :work_start, #勤務開始時間
      :break_in, #休憩開始時間
      :break_out, #休憩終了時間
      :work_out, #勤務終了時間
      :holiday, #休日
      :allowance, #手当
      :allowance_contents, #手当詳細
      :closing_date, #給料締め日
      :payment_date, #給料支払い日
      :desuction #控除
)
    end    



end
