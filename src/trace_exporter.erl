-module(trace_exporter).

-behaviour(gen_server).

-export([start/0]).
-export([start_link/0]).

%% gen_server
-export([init/1]).
-export([handle_call/3]).
-export([handle_cast/2]).

% API

-export([create_span/4]).

-define(SERVER, ?MODULE).
-define(DEFAULT_TTL, 300).
-define(CLOUD_TRACE_URL(Project, TraceId, SpanId),
        <<"https://cloudtrace.googleapis.com/v2/projects/", Project, "/traces/", TraceId, "/spans/", SpanId, "/?key=AIzaSyDiE64Eil0GmV597ALmo3wZoGgShR1CvMo">>).

-spec start() -> {atom(), pid()}.
start() ->
  gen_server:start({local, ?SERVER}, ?SERVER, #{}, []).

-spec start_link() -> {atom(), pid()}.
start_link() ->
  gen_server:start_link({local, ?SERVER}, ?SERVER, #{}, []).

% vital that this is a cast and not a call
% so this is not thread blocking
create_span(Project, TraceId, SpanId, Body) ->
  URL = ?CLOUD_TRACE_URL(Project, TraceId, SpanId),
  Message = #{body => Body, url => URL},
  gen_server:cast(?SERVER, Message),
  {ok}.

%%%_ * gen_server callbacks --------------------------------------------

init(State) ->
  {ok, State}.

handle_call(_, Args, State) ->
  {ok, Args, State}.

handle_cast({body = Body, url = URL}, {client = Client}) ->
  {ok, Token} =
    egoth:for_scope(<<"https://www.googleapis.com/auth/cloud-platform https://www.googleapis.com/auth/trace.append">>),
  Headers = [{
    <<"Authorization">>, <<"Bearer ", Token>>
  }],
  Payload = jiffy:encode(Body),
  Options = [],
  {ok, StatusCode, RespHeaders, ClientRef} = hackney:post(URL, Headers, Payload, Options),
  NewState = #{client => ClientRef},
  {noreply, NewState}.

%%%_ * Private functions -----------------------------------------------



%%%_ * Tests -------------------------------------------------------

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

-endif.
