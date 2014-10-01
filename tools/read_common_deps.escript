#!/usr/bin/env escript

main(Filename) ->
    case file:consult(Filename) of
        {ok, Terms} ->
            parse_file(Terms);
        {error, Reason} ->
            io:format("Failed to parse file: ~p.",[Reason])
    end.

parse_file(Data) ->
    {_, _, AppData} = hd(Data),
    case proplists:get_value(modules, AppData) of
        undefined ->
            io:format("Failed to find modules in file.", []);
        Modules ->
            lists:map(fun(X) -> io:format("~p.erl\n", [X]) end, Modules)
    end.
