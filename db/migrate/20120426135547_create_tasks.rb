class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string     :title, :current_state
      t.text       :description, :prereqs
      t.timestamps
    end
  end
end
