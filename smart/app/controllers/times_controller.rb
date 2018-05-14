class TimesController < ApplicationController

def through_date_user_list
    redirect_to :action =>'date_user_list',
                      :year => params[:date][:year],
                      :month => params[:date][:month],
                      :day => params[:date][:day]
  end

 def date_user_list
   @workcodes=Workcode.find_all
   @timecard_pages,@timecards = paginate(:timecard,
                                         :order =>'input_date',
                                         :include => [:workcode],
                                         :conditions => ["input_date= ?",Date.new(params[:year].to_i,
                                                                                  params[month].to_i,
                                                                                  params[:day].to_i)])
  end

end
