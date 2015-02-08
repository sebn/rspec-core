module RSpec
  module Core
    # @private
    class LookupSet
      include Enumerable

      def initialize(array=[])
        @values = {}
        merge(array)
      end

      def <<(key)
        @values[key] = true
      end

      def each(&block)
        @values.keys.each(&block)
      end

      def to_a
        @values.keys
      end

      def +(others)
        LookupSet.new(@values).merge(others)
      end

      def include?(key)
        @values[key] == true
      end

      def merge(values)
        values.each do |key|
          @values[key] = true
        end
      end
    end
  end
end
