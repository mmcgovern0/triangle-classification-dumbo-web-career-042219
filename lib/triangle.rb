class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
  	@a = a
  	@b = b
  	@c = c
  end

  def kind
  	is_triangle?
  	if a == b && b == c
  		:equilateral
	elsif a == b || b == c || a == c
		:isosceles
	else
		:scalene
	end
  end

  def is_triangle?
  	triangle = [(a + b > c), (a + c > b), (b + c > a)]
  
  	[a, b, c].each {|side| triangle << false if side <= 0 }

  	raise TriangleError if triangle.include?(false)
  end

  class TriangleError < StandardError

  end
end
