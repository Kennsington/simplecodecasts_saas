class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column :users, :plan_id, :string
  end
end