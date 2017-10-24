module Floodlight
  class LazyMetric
    class InvalidMetricTypeException < StandardError; end

    attr_accessor :name, :scope, :type

    def initialize(name, scope:, type:)
      raise InvalidMetricTypeException unless ['daily', 'cumulative'].include?(type)

      self.name = name
      self.scope = scope
      self.type = type
    end

    def compute(days_ago: 1)
      computed_scope = scope.call

      if type == 'daily'
        computed_scope = computed_scope.where("date(created_at) = date(?)", days_ago.to_i.days.ago)
      elsif type == 'cumulative'
        computed_scope = computed_scope.where("date(created_at) <= date(?)", days_ago.to_i.days.ago)
      end

      computed_scope.count
    end
  end
end
