# frozen_string_literal: true

require 'roar/decorator'
require 'roar/json'

module Leaf
  module Representers
    # Representer for converting Trip entity to and from JSON
    class Trip < Roar::Decorator
      include Roar::JSON

      property :id
      property :origin
      property :destination
      property :strategy
      property :distance
      property :duration

      def to_entity
        Leaf::Entity::Trip.new(
          id: represented.id,
          origin: represented.origin,
          destination: represented.destination,
          strategy: represented.strategy,
          distance: represented.distance,
          duration: represented.duration
        )
      end
    end
  end
end

# How It Works
# trip_entity = Leaf::Entity::Trip.new(
#   id: 1,
#   origin: 'Seattle',
#   destination: 'San Francisco',
#   strategy: 'driving',
#   distance: 1300,
#   duration: 780
# )

# serialized = Leaf::Representers::Trip.new(trip_entity).to_json
