module HomeHelper

  def month_to_str(n)
    if n == 1
      "Enero"
    elsif n == 2
      "Febrero"
    elsif n == 3
      "Marzo"
    elsif n == 4
      "Abril"
    elsif n == 5
      "Mayo"
    elsif n == 6
      "Junio"
    elsif n == 7
      "Julio"
    elsif n == 8
      "Agosto"
    elsif n == 9
      "Septiembre"
    elsif n == 10
      "Octubre"
    elsif n == 11
      "Noviembre"
    else
      "Diciembre"
    end
  end
end
