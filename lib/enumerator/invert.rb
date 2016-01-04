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

    def grep(pat)
      @obj - @obj.grep(pat)
    end
  end
end

# p [].methods.v.grep(/i/)
# p [].methods.v.grep(/i/) == [].methods.grep_v(/i/)
