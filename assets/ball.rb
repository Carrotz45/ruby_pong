class Ball

  attr_reader :points

  def initialize(img, x, y, x_dim, y_dim)

    @sprite = img

    @x = x
    @y = y

    @x_dim = x_dim
    @y_dim = y_dim

    @x_vel = 15.0
    @y_vel = 15.0
    @angle = [3, 2, 1, 0, -1, -2, -3].sample

    @points = 0

  end

  def update(paddle1_y, paddle2_y, paddle_width, paddle_height)

    @paddle1_y = paddle1_y
    @paddle2_y = paddle2_y

    @paddle_width = paddle_width
    @paddle_height = paddle_height

    if @x + @sprite.width >= @x_dim - @paddle_width && @y >= @paddle2_y && @y + @sprite.height <= @paddle2_y + @paddle_height
      
      @x = @x_dim-(@paddle_width + @sprite.width)
      x_vel = (@x_vel + @angle) * -1

    elsif @x <= @paddle_width && @y >= @paddle1_y && @y + @sprite.height <= @paddle1_y + @paddle_height

      @x = @paddle_width
      @x_vel = (@x_vel + @angle) * -1

    elsif @x >= @x_dim - @sprite.width || @x <= 0 

      @x_vel = (@x_vel + @angle) * -1
      @points = @points + 1

    end

    if @y >= @y_dim - @sprite.height|| @y <= 0

      @y_vel = (@y_vel + @angle) * -1

    end



    @x += @x_vel
    @y += @y_vel
    
  end

  def draw
    @sprite.draw(@x, @y)
  end

end

