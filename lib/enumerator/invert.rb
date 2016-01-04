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

    def all?(&block)
      !@obj.all?(&block)
    end

    def any?(&block)
      !@obj.any?(&block)
    end

    def sort(&block)
      @obj.sort(&block).reverse
    end
  end
end

p [].methods.v.grep(/i/) == [].methods.grep_v(/i/)
p [1,2,3].v.all?{|i| 2 < i} == !([1,2,3].all?{|i| 2 < i})
p [1,2,3].v.any?{|i| 2 < i} == !([1,2,3].any?{|i| 2 < i})
p [3,1,2].v.sort == [3,2,1]
