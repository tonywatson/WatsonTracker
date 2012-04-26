class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.belongs_to :task
      t.integer    :prereq
      t.timestamps
    end
  end
end
