class Paddle

  attr_reader :x, :y

  def initialize(img, up_button, down_button, x, y, x_dim, y_dim)
    @sprite = img

    @vel = 17
    @x = x
    @y = y

    @x_dim = x_dim
    @y_dim = y_dim

    @up_button = up_button
    @down_button = down_button

  end

  def moveUp
    @y = @y - @vel
  end

  def moveDown
    @y = @y + @vel
  end

  def update

    puts(@y)

    if (Gosu.button_down? @up_button) && @y > 0 
      moveUp()
    elsif (Gosu.button_down? @down_button) && @y < @y_dim-@sprite.height
      moveDown()
    end
  end


  def draw
    @sprite.draw(@x, @y)
  end

end
