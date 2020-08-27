-module(trace_exporter).

-behaviour(gen_server).

-include("trace.hrl").

% TODO: fix
% -include_lib("egoth/include/egoth.hrl").

-record(token, {
    token   :: string(),
    type    = undefined :: string() | undefined,
    scope   = undefined :: string() | undefined,
    sub     = undefined :: string() | undefined,
    expires :: non_neg_integer(),
    account :: string()
}).

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
  lists:concat(["https://cloudtrace.googleapis.com/v2/projects/", Project, "/traces/", TraceId, "/spans/", SpanId])).

-spec start() -> {atom(), pid()}.
start() ->
  gen_server:start({local, ?SERVER}, ?SERVER, #{}, []).

-spec start_link() -> {atom(), pid()}.
start_link() ->
  gen_server:start_link({local, ?SERVER}, ?SERVER, #{}, []).

% vital that this is a cast and not a call
% so this is not thread blocking
- spec create_span(Project, TraceId, SpanId, Body) -> Return when
  Project :: string(),
  TraceId :: string(),
  SpanId :: string(),
  Body  :: binary() | string(),
  Return :: ok.
create_span(Project, TraceId, SpanId, Body) ->
  URL = ?CLOUD_TRACE_URL(Project, TraceId, SpanId),
  Message = {Body, URL},
  gen_server:cast(?SERVER, Message).

%%%_ * gen_server callbacks --------------------------------------------

init(State) ->
  {ok, State}.

handle_call(_, Args, State) ->
  {reply, Args, State}.

handle_cast({Body, URL}, _State) ->
  {ok, Token} =
    egoth:for_scope(<<"https://www.googleapis.com/auth/cloud-platform https://www.googleapis.com/auth/trace.append">>),
  AccessToken = Token#token.token,
  Headers = [{
    <<"Authorization">>, <<"Bearer ", AccessToken/binary>>
  }, {
    <<"Content-Type">>, <<"application/json">>
  }],

  % TODO: support proto
  % ProtoBody = #'google.devtools.cloudtrace.v2.Span'{
  %   name = "something",
  %   span_id = "something"
  % },
  % Payload = trace:encode_msg(ProtoBody),

  Payload = jiffy:encode(Body),
  Options = [],
  {ok, _StatusCode, _RespHeaders, ClientRef} = hackney:post(URL, Headers, Payload, Options),
  NewState = #{client => ClientRef},
  {ok, _Body2} = hackney:body(ClientRef),
  % should we do anything with the response?
  {noreply, NewState}.

%%%_ * Private functions -----------------------------------------------



%%%_ * Tests -------------------------------------------------------

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

-endif.
