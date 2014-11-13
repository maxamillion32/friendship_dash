class Survey < ActiveRecord::Base
    before_validation :generate_guid,  on: :create

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Survey.create! row.to_hash
        end
    end

    def generate_guid
        self.guid = SecureRandom.uuid
    end
end
