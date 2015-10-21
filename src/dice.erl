%% @author sage
%% @doc Provide a six-sided dice as a RESTful web service.
%%
%% Definition given in RAML (<a href="http://raml.org">raml.org</a>):
%%
%% <pre>
%%  /dice:
%%    get:
%%      description: Gives you a single dice roll
%%      responses:
%%        200:
%%          body:
%%            application/json:
%%              schema: | 
%%                { "type": "object",
%%                  "properties": { 
%%                  "number": {"type": "int"},
%%                  "required": true
%%                }, 
%%              }
%%            example: '{ "number": 4 }'
%%
%% </pre>
%%
%% Optionally this module does evil things to test other services
%% Not yet implemented:
%%   - The RAML specification does not state what type of dice should have
%%     been rolled. So basically any integer value is valid
%%  

-module(dice).
-compile({parse_transform, leptus_pt}).

-define(MAX_DICE_RESULT,6).
%% ====================================================================
%% API functions
%% ====================================================================
%% leptus callbacks
-export([init/3]).
-export([get/3]).
-export([terminate/4]).

init(_Route, _Req, State) ->
    {ok, State}.

get("/dice", _Req, State) ->
    Status = ok,  %% HTTP Status 200
    Value = random:uniform(?MAX_DICE_RESULT),
    Body = [{<<"number">>, Value}],
    {Status, {json, Body}, State}.

terminate(_Reason, _Route, _Req, _State) ->
    ok.

%% ====================================================================
%% Internal functions
%% ====================================================================



