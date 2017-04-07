defmodule Stack.Server do
  use GenServer
  
  #API
  
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
  
  def pop do
    GenServer.call(__MODULE__, :pop)
  end
  
  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end
  
  #Callbacks
  
  def handle_call(:pop, _from, [head|tail]) do
    { :reply, head, tail }
  end
  
  def handle_cast({:push, value}, stack) do
    { :noreply, [value | stack] }
  end
  
end
