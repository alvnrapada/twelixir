defmodule TwilixirTest do
  use ExUnit.Case
  doctest Twilixir

  test "greets the world" do
    assert Twilixir.hello() == :world
  end
end
