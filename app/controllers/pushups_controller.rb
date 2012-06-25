class PushupsController < ApplicationController
  before_filter :authorize

  @@dates={:date_from    => '05/01/12',
           :date_to    => '06/01/12'}
 
  def index
    @push_counts=[]
    @goal_counts=[]
    @push_date=[]
     
    @user=User.find_by_id(session[:user_id])
    #flash[:notice] ="Hi, #{@user.name} !"
    @allpushups = Pushup.find(:all, :conditions => { :user => @user.name})
      
    @allpushups.each do |elm|
      if elm.count.to_i != nil and elm.count.to_i >0
        @push_counts << elm.count.to_i
        @goal_counts<<25
        @push_date << elm.created_at.strftime("%m/%d/%y")
      else
        #@push_counts << 0
      end
    end
    #flash[:notice] ="Counts!! #{@push_counts}"
    
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"PUSH UP RESULTS"}) 
      f.options[:chart][:defaultSeriesType] = "line" 
      f.xAxis(:categories => @push_date)#["05/01/12", "05/02/12", "05/03/12", "05/04/12", "05/05/12"])
      f.labels(:items=>[:html=>"Push-Ups Count", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
      f.series(:name=>'Your Goal',:yAxis => 0, :data=> @goal_counts)
      f.series(:name=>'Your result', :yAxis => 0,:data=> @push_counts)
    end
  end

  def new
    @user=User.find_by_id(session[:user_id])
    # default: render 'new' template
  end

  def create
    @push = Pushup.create!(params[:push])
    flash[:notice] = "#{@push.user}, your count of #{@push.count} was successfully recorded."
    redirect_to pushups_path
  end

  def edit
    @push = Pushup.find params[:id]
  end

  def update
    @push = Pushup.find params[:id]
    @push.update_attributes!(params[:push])
    flash[:notice] = "#{@push.user}, your record of '#{@push.count}' was successfully updated."
    redirect_to pushups_path(@push)
  end

  def destroy
    @push = Pushup.find(params[:id])
    @push.destroy
    flash[:notice] = "'#{@push.user}' your record of '#{@push.count}' was deleted."
    redirect_to pushups_path
  end

end