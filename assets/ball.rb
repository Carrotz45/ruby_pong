class Ball
  def initialize(img, x, y, xDim, yDim)

    @sprite = img

    @x = x
    @y = y

    @xDim = xDim
    @yDim = yDim

    @vel = 10

  end

  def update
  end

  def draw
    @sprite.draw(@x, @y)
  end

end

