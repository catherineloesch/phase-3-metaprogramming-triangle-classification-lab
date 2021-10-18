class Triangle

  attr_accessor :sides, :a, :b, :c

  def initialize(a, b, c)
    @sides = [a, b, c]
    @a = a
    @b = b
    @c = c

  end

  def kind
    if !self.valid_triangle? 
      raise TriangleError 
    elsif self.sides.uniq.length == 1
        :equilateral
    elsif self.sides.uniq.length == 2
        :isosceles
    else
        :scalene
    end
  end

  def valid_triangle?
    if self.sides.filter {|side| side > 0 }.length != 3
      false
    elsif !(a + b > c && a + c > b && b + c > a)
      false
    else
      true
    end
  end

  class TriangleError < StandardError
  end

end