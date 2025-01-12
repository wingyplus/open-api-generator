defmodule OpenAPI.Spec.Info.License do
  @moduledoc false

  #
  # Definition
  #

  @type t :: %__MODULE__{
          name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :name,
    :url
  ]

  #
  # Decoder
  #

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    license = %__MODULE__{
      name: Map.get(yaml, "name"),
      url: Map.get(yaml, "url")
    }

    {state, license}
  end
end
