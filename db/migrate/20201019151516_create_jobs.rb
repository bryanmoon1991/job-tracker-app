class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :snippet
      t.string :salary
      t.string :source
      t.string :type
      t.string :link
      t.string :updated

      t.timestamps
    end
  end
end
