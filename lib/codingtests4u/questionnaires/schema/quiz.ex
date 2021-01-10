defmodule Codingtests4u.Questionnaires.Schema.Quiz do
  use Ecto.Schema

  import Ecto.Changeset

  @timestamps_opts [type: :utc_datetime_usec]

  schema "quizzes" do
    field :score, :decimal
    field :limit_date_time, :utc_datetime

    timestamps()
  end

  def changeset(quiz, attrs) do
    quiz
    |> cast(attrs, [:score, :limit_date_time])
  end
end
