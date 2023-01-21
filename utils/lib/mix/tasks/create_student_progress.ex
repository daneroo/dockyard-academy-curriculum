defmodule Mix.Tasks.Bc.CreateStudentProgress do
  @moduledoc "Initialize Student Progress JSON file"
  @shortdoc @moduledoc

  alias Utils.Notebooks

  @student_progress_path "../student_progress.json"
  @outline_path "../start.livemd"

  use Mix.Task

  @impl Mix.Task
  def run(_) do
    content =
      File.read!(@outline_path)
      |> Notebooks.student_progress_map()
      |> Jason.encode!()

    File.write!(@student_progress_path, content)
  end
end
