#require "enumerator/invert/version"

module Enumerable
  def v
    Enumerator::Invert.new(self)
  end
end

class Enumerator
  class Invert < Enumerator
    def initialize(obj, &block)
      @obj = obj
    end

    def each(*args, &block)
      @obj.each(*args, &block)
    end

    def grep(pat)
      ret = []
      each do |i|
        if not pat === i
          ret << i
        end
      end
      ret
    end
  end
end

# p [].methods.v.grep(/i/)
# p [].methods.v.grep(/i/) == [].methods.grep_v(/i/)
