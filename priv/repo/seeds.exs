# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Codexamer.Repo.insert!(%Codexamer.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Codexamer.{Repo, Questionnaires}
alias Questionnaires.Schema.{Category, Question, QuestionOption}

current_time = DateTime.utc_now()

categories = ["Elixir", "Ruby", "Javascript"]

maps =
  Enum.map(categories, fn category ->
    %{
      name: category,
      inserted_at: current_time,
      updated_at: current_time
    }
  end)

{new_categories_count,
 [
   %Category{
     id: elixir_category_id,
     name: "Elixir"
   },
   _ruby_category,
   _javascript_category
 ]} = Repo.insert_all(Category, maps, returning: [:id, :name])

IO.puts("#{new_categories_count} categories have been inserted successfully.")

{:ok, question1} =
  Repo.insert(
    Question.changeset(%Question{}, %{
      title: "Who created the elixir programming language?",
      type: "one_answer",
      category_id: elixir_category_id,
      inserted_at: current_time,
      updated_at: current_time
    })
  )

IO.puts("Question: '#{question1.title}' inserted successfully")

{new_question1_options_count, _} =
  Repo.insert_all(QuestionOption, [
    %{
      question_id: question1.id,
      is_valid: false,
      description: "John Doe",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question1.id,
      is_valid: true,
      description: "Jose Valim",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question1.id,
      is_valid: false,
      description: "Jane Doe",
      inserted_at: current_time,
      updated_at: current_time
    }
  ])

IO.puts("#{new_question1_options_count} questions were inserted for question1")

{:ok, question2} =
  Repo.insert(
    Question.changeset(%Question{}, %{
      title: "What's a list in elixir?",
      type: "one_answer",
      category_id: elixir_category_id,
      inserted_at: current_time,
      updated_at: current_time
    })
  )

IO.puts("Question: '#{question2.title}' inserted successfully")

{new_question2_options_count, _} =
  Repo.insert_all(QuestionOption, [
    %{
      question_id: question2.id,
      is_valid: true,
      description:
        "Lists are data structures that hold zero, one, or more elements in the chosen order.",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question2.id,
      is_valid: false,
      description: "Wrong answer 1",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question2.id,
      is_valid: false,
      description: "Wrong answer 2",
      inserted_at: current_time,
      updated_at: current_time
    }
  ])

IO.puts("#{new_question2_options_count} questions were inserted for question2")

{:ok, question3} =
  Repo.insert(
    Question.changeset(%Question{}, %{
      title: "What's an alias in elixir?",
      type: "one_answer",
      category_id: elixir_category_id,
      inserted_at: current_time,
      updated_at: current_time
    })
  )

IO.puts("Question: '#{question3.title}' inserted successfully")

{new_question3_options_count, _} =
  Repo.insert_all(QuestionOption, [
    %{
      question_id: question3.id,
      is_valid: false,
      description: "Wrong answer 1",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question3.id,
      is_valid: true,
      description: "it allows you to set up aliases for any given module name.",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question3.id,
      is_valid: false,
      description: "Wrong answer 2",
      inserted_at: current_time,
      updated_at: current_time
    }
  ])

IO.puts("#{new_question3_options_count} questions were inserted for question3")

{:ok, question4} =
  Repo.insert(
    Question.changeset(%Question{}, %{
      title: "What's an elixir module?",
      type: "one_answer",
      category_id: elixir_category_id,
      inserted_at: current_time,
      updated_at: current_time
    })
  )

IO.puts("Question: '#{question4.title}' inserted successfully")

{new_question4_options_count, _} =
  Repo.insert_all(QuestionOption, [
    %{
      question_id: question4.id,
      is_valid: false,
      description: "Wrong answer 1",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question4.id,
      is_valid: false,
      description: "Wrong answer 2",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question4.id,
      is_valid: true,
      description: "A group of functions",
      inserted_at: current_time,
      updated_at: current_time
    }
  ])

IO.puts("#{new_question4_options_count} questions were inserted for question4")

{:ok, question5} =
  Repo.insert(
    Question.changeset(%Question{}, %{
      title: "What's the case clause in elixir used for?",
      type: "one_answer",
      category_id: elixir_category_id,
      inserted_at: current_time,
      updated_at: current_time
    })
  )

IO.puts("Question: '#{question5.title}' inserted successfully")

{new_question5_options_count, _} =
  Repo.insert_all(QuestionOption, [
    %{
      question_id: question5.id,
      is_valid: true,
      description:
        "It allows us to compare a value against many patterns until we find a matching one",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question5.id,
      is_valid: false,
      description: "Wrong answer 2",
      inserted_at: current_time,
      updated_at: current_time
    },
    %{
      question_id: question5.id,
      is_valid: false,
      description: "Wrong answer 1",
      inserted_at: current_time,
      updated_at: current_time
    }
  ])

IO.puts("#{new_question5_options_count} questions were inserted for question5")
