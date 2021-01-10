defmodule Codingtests4u.Questionnaires.Repo.QuizRepo do
  alias Codingtests4u.{Repo, Questionnaires}
  alias Questionnaires.Schema.{Quiz, Question, QuestionQuiz}
  alias Ecto.Multi

  import Ecto.Query, only: [from: 2]

  def create(category_id) do
    Multi.new()
    |> Multi.run(:get_random_questions, fn repo, _changes ->
      get_random_questions(repo, category_id)
    end)
    |> Multi.insert(:insert_quiz, Quiz.changeset(%Quiz{}, %{}))
    |> Multi.run(:insert_questions_quizzes, fn repo, changes ->
      insert_questions_quizzes(repo, changes)
    end)
    |> Repo.transaction()
  end

  defp get_random_questions(repo, category_id) do
    query =
      from q in Question,
        where: q.category_id == ^category_id,
        order_by: fragment("RANDOM()"),
        limit: 3

    {:ok, repo.all(query)}
  end

  defp insert_questions_quizzes(
         repo,
         %{
           get_random_questions: questions,
           insert_quiz: %Quiz{id: quiz_id}
         } = changes
       ) do
    current_time = DateTime.utc_now()
    IO.inspect(changes)

    {:ok,
     repo.insert_all(
       QuestionQuiz,
       Enum.map(questions, fn question ->
         %{
           question_id: question.id,
           quiz_id: quiz_id,
           inserted_at: current_time,
           updated_at: current_time
         }
       end)
     )}
  end
end
