defmodule OpenAPI.Spec.Tag do
  @moduledoc false
  alias OpenAPI.Spec
  alias OpenAPI.Spec.ExternalDocumentation

  #
  # Definition
  #

  @typedoc "Open API specification"
  @type t :: %__MODULE__{
          name: String.t(),
          description: String.t() | nil,
          external_docs: Spec.ExternalDocumentation.t() | nil
        }

  defstruct [
    :name,
    :description,
    :external_docs
  ]

  #
  # Decoder
  #

  @spec decode(map, map, map) :: {map, t}
  def decode(state, spec, yaml) do
    {state, docs} = decode_external_docs(state, spec, yaml)

    tag = %__MODULE__{
      name: Map.fetch!(yaml, "name"),
      description: Map.get(yaml, "description"),
      external_docs: docs
    }

    {state, tag}
  end

  @spec decode_external_docs(map, map, map) :: {map, ExternalDocumentation.t() | nil}
  defp decode_external_docs(state, spec, %{"external_docs" => docs}),
    do: ExternalDocumentation.decode(state, spec, docs)

  defp decode_external_docs(state, _spec, _docs), do: {state, nil}
end
