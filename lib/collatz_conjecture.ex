defmodule CollatzConjecture do
  defguardp is_even(term) when is_integer(term) and term > 0 and rem(term, 2) == 0
  defguardp is_positive(t) when is_integer(t) and t > 0
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input == 1, do: 0
  def calc(input) when is_positive(input) and is_even(input) do
    x = (input / 2) |> round |> calc
    x + 1
  end
  def calc(input) when is_positive(input), do: 1 + calc((3 * input + 1))
end
