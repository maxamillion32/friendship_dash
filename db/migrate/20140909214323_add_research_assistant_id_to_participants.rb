class AddResearchAssistantIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :research_assistant_id, :integer
  end
end
