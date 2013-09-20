-module(privdir).

-export([get/1]).

get(App) ->
  case code:priv_dir(App) of
    {error, bad_name} ->
      Ebin = filename:dirname(code:which(App)),
      filename:join(filename:dirname(Ebin), "priv");
    Path ->
      Path
  end.
