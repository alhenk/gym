class AddMorePullups < ActiveRecord::Migration
  MORE_PULLUPS = [
    {:user => 'Alhen', :count => '20',:note => 'first week'},
    {:user => 'Alhen', :count => '21',:note => 'first week'},
    {:user => 'Alhen', :count => '25',:note => 'first week'},
    {:user => 'Borat', :count => '28',:note => 'first week'},
    {:user => 'Alhen', :count => '15',:note => 'first week'},
    {:user => 'Borat', :count => '12',:note => 'first week'},
    {:user => 'Borat', :count => '23',:note => 'first week'},
    {:user => 'Alhen', :count => '24',:note => 'first week'},
    ]

  def up
    MORE_PULLUPS.each do |records|
      Pullup.create!(records)
    end
  end

  def down
    MORE_PULLUPS.each do |push|
      Pullup.find_by_date_and_user(push[:date], push[:user]).destroy
    end
  end

end