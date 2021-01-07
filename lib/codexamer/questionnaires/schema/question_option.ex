defmodule Codexamer.Questionnaires.Schema.QuestionOption do
  use Ecto.Schema

  import Ecto.Changeset

  alias Codexamer.Questionnaires.Schema.Question

  @timestamps_opts [type: :utc_datetime_usec]

  schema "questions_options" do
    field :is_valid, :boolean
    field :description, :string

    belongs_to :question, Question

    timestamps()
  end

  def changeset(question_option, attrs) do
    question_option
    |> cast(attrs, [:is_valid, :description, :question_id])
    |> validate_required([:question_id])
  end
end
