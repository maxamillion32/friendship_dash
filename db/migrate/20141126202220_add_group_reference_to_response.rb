class AddGroupReferenceToResponse < ActiveRecord::Migration
  def change
    add_reference :responses, :group, index: true
  end
end
