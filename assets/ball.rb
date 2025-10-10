class Ball < Grill

  attr_reader :points_p1, :points_p2

  def initialize(img, x, y, window)

    @sprite = img
    @x = window.width / 2
    @y = window.width / 2
    @window = window

    #@x_dim = window.width
    #@y_dim = window.height

    @x_vel = 15.0
    @y_vel = 15.0
    @angle = [3, 2, 1, 0, -1, -2, -3].sample

    @points_p1 = 0
    @points_p2 = 0

  end

  def bounce_x
    @x_vel = (@x_vel + @angle) * - 1
  end

  def bounce_y
    @y_vel = (@y_vel + @angle) * - 1
  end

  def right=(x)
    @x = x - self.width
  end

  def left=(x)
    @x = x
  end

  def top=(y)
    @y = y
  end

  def bottom=(y)
    @y = y - self.height
  end


  def update(paddle1, paddle2)

    #right paddle
    if self.right >= paddle2.left &&
      self.left <= paddle2.right &&
      self.top <= paddle2.bottom &&
      self.bottom >= paddle2.top
       
      self.bounce_x

      self.right = (paddle2.left - 1)

    #left paddle
    elsif self.left <= paddle1.right&&
      self.right >= paddle1.left
      self.top >= paddle2.top &&
      self.bottom <= paddle2.bottom
      
      self.bounce_x

      self.left = (paddle1.right + 1)

    #right wall
    elsif self.right > @window.width

      self.bounce_x

      @points_p2 = @points_p2 + 1

    #left wall
    elsif self.left <= 0

      self.bounce_x

      @points_p1 = @points_p2 + 1

    #bottom wall
    elsif self.bottom > @window.height

      self.bounce_y

      self.bottom = (@window.height-1)

    #top wall
    elsif self.top < 0

      self.bounce_y

      self.top = (1)

    end

    @x += @x_vel
    @y += @y_vel
    
  end

  def draw
    @sprite.draw(@x, @y)
  end

end

