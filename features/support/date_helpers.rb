module DateHelpers
  def parsed_time(str)
    d = DateTime.parse(str)
    DateTime.parse(d.strftime("%d/%m/%y %h:%m"))
  end

  def dt_suffix
     {
      :year   => '1i',
      :month  => '2i',
      :day    => '3i',
      :hour   => '4i',
      :minute => '5i'
    }
  end
end
World(DateHelpers)
