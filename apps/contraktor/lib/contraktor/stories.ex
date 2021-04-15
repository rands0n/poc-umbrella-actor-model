defmodule Contraktor.Stories do
  @moduledoc false

  alias Contraktor.Repo
  alias Contraktor.Stories.Post

  @spec get_one_post(String.t()) :: %Post{} | nil
  def get_one_post(post_id) do
    Post
    |> Repo.get(post_id)
  end
end
