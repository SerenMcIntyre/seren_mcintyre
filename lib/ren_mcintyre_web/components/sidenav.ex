defmodule RenMcintyreWeb.Sidenav do
  @moduledoc """
  A sidenav
  """
  use Phoenix.Component

  @doc """
    
  """
  def sidenav(assigns) do
    ~H"""
    <nav class="p-8 w-80 hidden sm:flex flex-col items-center bg-accent
      justify-between">
      <h1 class="text-2xl font-bold">Ren McIntyre</h1>

      <.links />
      <.socials />
    </nav>
    """
  end

  def sidenav_mobile(assigns) do
    ~H"""
    <nav id="navbar-mobile" class="sticky top-0 bg-accent sm:hidden h-18 text-xl">
      <section id="navbar-mobile-header" class="flex justify-between p-4 items-center">
        <span class="spacer"></span>
        <h1 class="text-xl font-bold">Ren McIntyre</h1>
        <button id="toggle-nav" aria-label="Expand Navbar"><Lucideicons.menu /></button>
      </section>

      <section
        id="navbar-mobile-content"
        class="content justify-around transition-all flex flex-col gap-4 ease-in-out duration-300"
      >
        <.links />
        <.socials />
      </section>
    </nav>
    """
  end

  def links(assigns) do
    ~H"""
    <section
      id="main-links"
      class="gap-4 w-full flex flex-col justify-center duration-300 transition-all"
    >
      <a href="/">Home</a>
      <a href="/tools">Tools</a>
      <a href="/blog">Blogs</a>
    </section>
    """
  end

  def socials(assigns) do
    ~H"""
    <section id="socials" class="gap-4 flex justify-center">
      <a
        class="socials hover:animate-jiggle"
        href="https://github.com/RentonMcIntyre/"
        target="blank"
        aria-label="GitHub Profile"
      >
        <Lucideicons.github />
      </a>
      <a
        class="socials hover:animate-jiggle"
        href="https://www.linkedin.com/in/renton-mcintyre/"
        target="blank"
        aria-label="LinkedIn Profile"
      >
        <Lucideicons.linkedin />
      </a>
    </section>
    """
  end
end
