defmodule Codexamer.Questionnaires.Schema.QuestionQuiz do
  use Ecto.Schema

  import Ecto.Changeset

  alias Codexamer.Questionnaires.Schema.{Question, Quiz}

  @timestamps_opts [type: :utc_datetime_usec]

  schema "questions_quizzes" do
    field :score, :decimal

    belongs_to :question, Question
    belongs_to :quiz, Quiz

    timestamps()
  end

  def changeset(question_quiz, attrs) do
    question_quiz
    |> cast(attrs, [:score, :question_id, :quiz_id])
    |> validate_required([:question_id, :quiz_id])
  end
end
