defmodule Codingtests4u.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :title, :string, null: false
      add :type, :string, null: false

      add :category_id, references(:categories, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
