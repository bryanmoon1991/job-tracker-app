class RenameTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :jobs, :type, :job_type
  end
end
