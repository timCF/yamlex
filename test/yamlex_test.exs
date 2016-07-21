defmodule YamlexTest do
	use ExUnit.Case
	doctest Yamlex

	test "can encode and decode" do
		inp = File.read!("./test/in.yml")
		assert inp == (inp |> Yamlex.decode |> Yamlex.encode |> Yamlex.decode |> Yamlex.encode)
	end
end
