class Paddle

  def initialize(img, upButton, downButton, x, y, xDim, yDim)
    @sprite = img

    @vel = 10
    @x = x
    @y = y

    @xDim = xDim
    @yDim = yDim

    @upB = upButton
    @downB = downButton

  end

  def moveUp
    @y = @y - @vel
  end

  def moveDown
    @y = @y + @vel
  end

  def update

    puts(@y)

    if (Gosu.button_down? @upB) && @y > 0 
      moveUp()
    elsif (Gosu.button_down? @downB) && @y < @yDim-@sprite.height
      moveDown()
    end
  end


  def draw
    @sprite.draw(@x, @y)
  end

  # def x

  # end

  # def y
  # end
  
end

# ex player1 = 