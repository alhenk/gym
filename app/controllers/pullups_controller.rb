class PullupsController < ApplicationController
  before_filter :authorize

  @@dates={:date_from    => '05/01/12',
           :date_to    => '06/01/12'}
         
  def index 
      @pull_counts=[]
      @goal_counts=[]
      @pull_date=[]
      
      
      @user=User.find_by_id(session[:user_id])
      #flash[:notice] ="Hi, #{@user.name} !"
      @allpullups = Pullup.find(:all, :conditions => { :user => @user.name})

      @allpullups.each do |elm|
        if elm.count.to_i != nil and elm.count.to_i >0
          @pull_counts << elm.count.to_i
          @goal_counts<<25
          @pull_date << elm.created_at.strftime("%m/%d/%y")
        else
          #@pull_counts << 0
        end
      end
      
      @h = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text=>"PULL UP RESULTS"}) 
        f.options[:chart][:defaultSeriesType] = "line" 
        f.xAxis(:categories => @pull_date)#["05/01/12", "05/02/12", "05/03/12", "05/04/12", "05/05/12"])
        f.labels(:items=>[:html=>"Pull-Ups Count", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
        f.series(:name=>'Your Goal',:yAxis => 0, :data=> @goal_counts)
        f.series(:name=>'Your result', :yAxis => 0,:data=> @pull_counts)
     end
  end

  def new
    @user=User.find_by_id(session[:user_id])
    # default: render 'new' template
  end

  def create
    @pull = Pullup.create!(params[:pull])
    flash[:notice] = "#{@pull.user}, your count of #{@pull.count} was successfully recorded."
    redirect_to pullups_path
  end

  def edit
    @pull = Pullup.find params[:id]
  end

  def update
    @pull = Pullup.find params[:id]
    @pull.update_attributes!(params[:pull])
    flash[:notice] = "#{@pull.user}, your record of '#{@pull.count}' was successfully updated."
    redirect_to pullups_path(@pull)
  end

  def destroy
    @pull = Pullup.find(params[:id])
    @pull.destroy
    flash[:notice] = "'#{@pull.user}' your record of '#{@pull.count}' was deleted."
    redirect_to pullups_path
  end
  
end
