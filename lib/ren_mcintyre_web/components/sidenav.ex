defmodule RenMcintyreWeb.Sidenav do
  @moduledoc """
  A sidenav
  """
  use Phoenix.Component

  @doc """
    
  """
  def sidenav(assigns) do
    ~H"""
    <nav class="p-8 w-80 flex flex-col items-center
      justify-between">
      <h1 class="text-2xl font-bold">Ren McIntyre</h1>

      <section id="main-links" class="w-3/4 gap-4 flex flex-col justify-center">
        <a href="/">Item 1</a>
        <a href="/blog">Item 2</a>
        <a href="/about">Item 3</a>
      </section>

      <section id="socials" class="w-3/4 gap-4 flex justify-center">
        <a
          class="socials hover:animate-jiggle"
          href="https://github.com/RentonMcIntyre/"
          target="blank"
        >
          <Lucideicons.github />
        </a>
        <a
          class="socials hover:animate-jiggle"
          href="https://www.linkedin.com/in/renton-mcintyre/"
          target="blank"
        >
          <Lucideicons.linkedin />
        </a>
      </section>
    </nav>
    """
  end
end
