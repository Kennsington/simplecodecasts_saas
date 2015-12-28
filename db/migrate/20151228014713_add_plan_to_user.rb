class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column :users, :plan_id, :integer 
    #adds a column to users table to use plan id as a 
    #foreign key in integer form to denote basic or pro account
  end
end
