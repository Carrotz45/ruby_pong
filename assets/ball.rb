class Ball
  def initialize(img, x, y, x_dim, y_dim)

    @sprite = img

    @x = x
    @y = y

    @x_dim = x_dim
    @y_dim = y_dim

    @x_vel = 15.0
    @y_vel = 15.0
    @angle = [3, 2, 1, 0, -1, -2, -3].sample

  end

  def update(paddle1_y, paddle2_y, paddle_width, paddle_height)

    @paddle1_y = paddle1_y
    @paddle2_y = paddle2_y

    @paddle_width = paddle_width
    @paddle_height = paddle_height

    if @x >= @x_dim - @sprite.width || @x <= 0 

      @x_vel = (@x_vel + @angle) * -1

    elsif @y >= @y_dim - @sprite.height|| @y <= 0

      @y_vel = (@y_vel + @angle) * -1

    end

    @x += @x_vel
    @y += @y_vel
    
  end

  def draw
    @sprite.draw(@x, @y)
  end

end

