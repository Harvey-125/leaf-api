# frozen_string_literal: true

module LeafAPI
  module Repository
    # Repository for Locations
    class Location
      def self.find_id(id)
        rebuild_entity Database::LocationOrm.first(id: id)
      end

      def self.find_name(name)
        rebuild_entity Database::LocationOrm.first(name: name)
      end

      def self.rebuild_entity(db_record)
        return nil unless db_record

        Entity::Location.new(
          id: db_record.id,
          name: db_record.name,
          latitude: db_record.latitude,
          longitude: db_record.longitude
        )
      end

      def self.rebuild_many(db_records)
        db_records.map do |db_location|
          Location.rebuild_entity(db_location)
        end
      end

      def self.db_find_or_create(entity)
        Database::LocationOrm.find_or_create(entity.to_attr_hash)
      end
    end
  end
end
