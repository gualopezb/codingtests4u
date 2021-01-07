defmodule Codexamer.Questionnaires.Schema.Question do
  use Ecto.Schema

  import Ecto.Changeset

  alias Codexamer.Questionnaires.Schema.Category

  @timestamps_opts [type: :utc_datetime_usec]

  schema "questions" do
    field :title, :string
    field :type, :string

    belongs_to :category, Category

    timestamps()
  end

  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :type, :category_id])
    |> validate_required([:title, :type, :category_id])
  end
end
