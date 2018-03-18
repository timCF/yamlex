defmodule Yamlex do
	use Application

	defstruct keys_atoms: true

	# See http://elixir-lang.org/docs/stable/elixir/Application.html
	# for more information on OTP Applications
	def start(_type, _args) do
		import Supervisor.Spec, warn: false

		# Define workers and child supervisors to be supervised
		children = [
		# Starts a worker by calling: Yamlex.Worker.start_link(arg1, arg2, arg3)
		# worker(Yamlex.Worker, [arg1, arg2, arg3]),
		]

		# See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
		# for other strategies and supported options
		opts = [strategy: :one_for_one, name: Yamlex.Supervisor]
		Supervisor.start_link(children, opts)
	end

	defp to_tree(lst = [{_,_}|_]), do: Enum.reduce(lst, %{}, fn({k,v},acc) -> Map.put(acc,k,to_tree(v)) end)
	defp to_tree(lst = [_|_]), do: Enum.map(lst, &to_tree/1)
	defp to_tree(some), do: some

	defp from_tree(map = %{}), do: Enum.map(map, fn({k,v}) -> {Aspire.to_number(k), from_tree(v)} end)
	defp from_tree(lst = [_|_]), do: Enum.map(lst, &from_tree/1)
	defp from_tree(some), do: some

	def decode(bin, opts \\ %Yamlex{})
	def decode(bin, %Yamlex{keys_atoms: keys_atoms}) when is_binary(bin) and is_boolean(keys_atoms) do
		{:ok, [data]} = :fast_yaml.decode(bin, [plain_as_atom: keys_atoms])
		to_tree(data)
	end

	def encode(some), do: (some |> from_tree |> :fast_yaml.encode |> List.flatten |> :binary.list_to_bin)

end
