class CartesianProduct
  include Enumerable

  def initialize(c1, c2)
    @c1 = c1
    @c2 = c2
  end

  def each
    @c1.each do |c_one|
      @c2.each { |c_two| yield [c_one, c_two] }
    end
  end

end
