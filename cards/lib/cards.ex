defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

		iex> Cards.hello()
		:world

  """

  def createDeck do
	  values = ["Ace","Two","Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
	  suits = ["Spades", "Diamonds", "Clubs", "Hearts"]

		for value <- values, suit <- suits do
			"#{value} of #{suit}"
		end
  end

  def shuffle(deck) do
  	Enum.shuffle(deck)
  end

  def contains?(deck,card) do
  	Enum.member?(deck,card)
  end

  def deal(deck,hand_size) do
  	Enum.split(deck,hand_size)
  end

  def save(deck,filename) do
  	binary=:erlang.term_to_binary(deck)
	File.write(filename,binary)
  end

  def load(filename) do
  	{status, binary} =File.read(filename)

	case status do
		:ok -> :erlang.binary_to_term(binary)
		:error -> "An error occurred"
	end
  end

end
