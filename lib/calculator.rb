class Calculator
  def sum a, b
    a + b
  end

  def div a, b
    a / b
  rescue => e
    "cant divide by zero" if e.is_a?(ZeroDivisionError)
  end
end
