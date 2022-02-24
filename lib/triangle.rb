class Triangle

  attr_accessor :sides

  def initialize(a, b, c)
    @sides = [a, b, c]
  end

  def valid_triangle?
    c1 = @sides.map {|side | side > 0}.all?
    c2 = @sides[0] + @sides[1] > @sides[2]
    c3 = @sides[1] + @sides[2] > @sides[0]
    c4 = @sides[0] + @sides[2] > @sides[1]

    [c1, c2, c3, c4].all?
  end

  def kind
    if !valid_triangle?
      raise TriangleError
    elsif @sides.uniq.length == 1
      :equilateral
    elsif @sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end