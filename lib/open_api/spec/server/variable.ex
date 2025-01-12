defmodule OpenAPI.Spec.Server.Variable do
  @moduledoc false

  #
  # Definition
  #

  @type t :: %__MODULE__{
          enum: nonempty_list(String.t()) | nil,
          default: String.t(),
          description: String.t() | nil
        }

  defstruct [
    :enum,
    :default,
    :description
  ]

  #
  # Decoder
  #

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    variable = %__MODULE__{
      enum: Map.get(yaml, "enum"),
      default: Map.fetch!(yaml, "default"),
      description: Map.get(yaml, "description")
    }

    {state, variable}
  end
end
