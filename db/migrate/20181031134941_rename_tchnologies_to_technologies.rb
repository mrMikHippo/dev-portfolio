class RenameTchnologiesToTechnologies < ActiveRecord::Migration[5.2]
  def change
  	rename_table :tchnologies, :technologies
  end
end
