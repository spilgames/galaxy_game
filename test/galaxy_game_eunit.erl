-module(galaxy_game_eunit).

-include_lib("eunit/include/eunit.hrl").

galaxy_game_test_() ->
    P = [mercury, venus, earth, mars],
    S = [venus, earth],
    As = [{mercury, venus}, {venus, earth}],
    A = [{nuclear, venus}, {laser, earth}],
    Exp = [earth, mars],
    [
        {setup, 
            %Setup
            fun () -> galaxy_game:setup_universe(P, S, As) end,
            %Teardown
            fun (ok) -> galaxy_game:teardown_universe(P) end,
            %Tests
            fun (ok) ->
                    case is_valid_setup(P, S, As) of
                        {true, true, true} ->
                            ?_assertEqual(true, true);
                        V ->
                            validity_printout(V),
                            ?assertEqual(true, false)
                    end
            end
        },
        {setup, 
            %Setup
            fun () -> galaxy_game:setup_universe(P, S, As) end,
            %Teardown
            fun (ok) -> galaxy_game:teardown_universe(P) end,
            %Tests
            fun (ok) -> [?_assertEqual(Exp, galaxy_game:simulate_attack(P, A))] end
        }
    ].


%%==============================================================================
%% Internal Functions
%%==============================================================================

is_valid_setup(Planets, Shields, Alliances) ->
    VPlanets = valid_planets(Planets),
    case VPlanets of
        true -> {VPlanets, planets_shielded(Shields), allied(Alliances)};
        false -> {false, untested, untested}
    end.

valid_planets(Planets) ->
    lists:all(fun (P) ->
                PPid = whereis(P),
                PPid /= undefined andalso erlang:is_process_alive(PPid)
        end, Planets).

planets_shielded(Shields) ->
    lists:all(fun (S) ->
                {trap_exit, true} == erlang:process_info(whereis(S), trap_exit)
        end, Shields).

allied(Alliances) ->
    lists:all(fun ({X, Y}) ->
                {links, Links} = erlang:process_info(whereis(X), links),
                YPid = whereis(Y),
                lists:member(YPid, Links)
        end, Alliances).

validity_printout(Validity) ->
    Printout = lists:zip([valid_planets, planets_shielded, planets_allied],
                         tuple_to_list(Validity)),
    ?debugFmt("Invalid Universe Setup:~n~p~n", [Printout]),
    false.