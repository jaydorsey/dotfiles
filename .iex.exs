# source: https://extips.blackode.in/part1
#
# IEx.configure colors: [enabled: true]
# IEx.configure colors: [ eval_result: [ :cyan, :bright ] ]
Code.compiler_options(ignore_module_conflict: true)

IO.puts("<shell history is found in #{:filename.basedir(:user_cache, "erlang-history")}>")
Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure(
  colors: [
    eval_result: [:green, :bright],
    eval_error: [:red, :bright],
    eval_info: [:yellow, :bright]
  ],
  inspect: [
    limit: :infinity,
    pretty: true,
    width: 160
  ],
  width: 160,
  default_prompt:
    [
      "\e[G",
      :white,
      "%prefix ",
      :magenta,
      # Elixir symbol from nerdfonts
      "\ue62d",
      " |>",
      :reset
    ]
    |> IO.ANSI.format()
    |> IO.chardata_to_string()
)
