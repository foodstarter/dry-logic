module Dry
  module Logic
    class Rule::Key < Rule
      def self.new(name, predicate)
        super(name, predicate.curry(name))
      end

      def type
        :key
      end

      def evaluate_input(input)
        input[name]
      end

      def call(input)
        Logic::Result::LazyValue.new(input, predicate.(input), self)
      end
    end
  end
end
