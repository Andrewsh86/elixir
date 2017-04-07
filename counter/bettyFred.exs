defmodule BettyFred do
  
  def process(pid) do
    receive do
      msg -> send pid, msg
    end
  end
  
  def run do
    betty = spawn(BettyFred, :process, [self])
    fred = spawn(BettyFred, :process, [self])
    
    send betty, "betty"
    
    receive do
      answer when is_binary(answer) ->
        IO.puts "got '#{answer}'"
    end
    
    send fred, "fred"
    
    receive do
      answer when is_binary(answer) ->
        IO.puts "got '#{answer}'"
    end
  end
  
  
end
