class ChangeNameToFirstName < ActiveRecord::Migration[7.0]
  def change
              #  table(s) #col  #new name
    rename_column :contacts, :name, :first_name
  end
end
