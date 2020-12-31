defmodule Codexamer.Repo.Migrations.CreateQuestionsOptions do
  use Ecto.Migration

  def change do
    create table(:questions_options) do
      add :is_valid, :boolean
      add :description, :string
      add :raw_valid_answer, :string

      add :question_id, references(:questions, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
