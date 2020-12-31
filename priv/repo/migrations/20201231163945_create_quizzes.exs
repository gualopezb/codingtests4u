defmodule Codexamer.Repo.Migrations.CreateQuizzes do
  use Ecto.Migration

  def change do
    create table(:quizzes) do
      add :score, :decimal
      add :limit_date_time, :utc_datetime

      timestamps()
    end
  end
end
