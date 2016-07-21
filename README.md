# Yamlex

Simple NIF-based ( libyaml ) Elixir library. Can decode and encode YAML data.

### Deps

```
apt-get install -y make autoconf automake libtool gcc g++
```
On **Mac OS X** also
```
brew install libyaml
```

### Usage

```
MacBook-Pro-tim:yamlex tim$ iex -S mix
Erlang/OTP 19 [erts-8.0.2] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.3.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Yamlex.decode("a: 1\nb: [\"hello\",-3.0]")
%{a: 1, b: ["hello", -3.0]}
iex(2)> Yamlex.decode("a: 1\nb: [\"hello\",-3.0]") |> Yamlex.encode |> Yamlex.decode
%{a: 1, b: ["hello", -3.0]}
iex(3)> Yamlex.decode("a: 1\nb: [\"hello\",-3.0]", %Yamlex{keys_atoms: false})
%{"a" => 1, "b" => ["hello", -3.0]}
iex(4)> Yamlex.decode("a: 1\nb: [\"hello\",{c: \"world\",d: \"!!!\"}]") |> Yamlex.encode |> IO.puts
a: 1
b:
  - "hello"
  -
    c: "world"
    d: "!!!"
:ok
iex(5)>
```
