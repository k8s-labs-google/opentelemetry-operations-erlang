%%%-------------------------------------------------------------------
%% @doc trace_exporter top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(trace_exporter_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    % % TODO: push projectId into config init
    % ProjectId = <<"terraform-seed-splunk">>,
    % TraceId  = <<"299d39ee2b0af307536490dc37c11356">>,
    % SpanId  = <<"1234942831952321">>,
    % Body = #{
    %     <<"startTime">> => <<"2020-08-21T06:30:59Z">>,
    %     <<"endTime">> => <<"2020-08-21T06:32:01Z">>,
    %     <<"spanId">> => SpanId,
    %     <<"displayName">> => #{
    %         <<"value">> => <<"errrrlang los four">>,
    %         <<"truncatedByteCount">> => 0
    %     }
    % },
    % trace_exporter:create_span(ProjectId, TraceId, SpanId, Body),

    % TraceId2 = "299d39ee2b0af307536490dc37c11356",
    % SpanId2  = "1234942831952321",
    % Body2 = #{
    %     <<"startTime">> => <<"2020-08-21T06:30:59Z">>,
    %     <<"endTime">> => <<"2020-08-21T06:32:01Z">>,
    %     <<"spanId">> => <<"1234952831958321">>,
    %     <<"displayName">> => #{
    %         <<"value">> => <<"errrrlang los five">>,
    %         <<"truncatedByteCount">> => 0
    %     }
    % },
    % trace_exporter:create_span(ProjectId, TraceId2, SpanId2, Body2),
    % io:fwrite("Hello Worldddd!~n"),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).


init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = [#{id => trace_exporter,
                    start => {trace_exporter, start_link, []},
                    restart => permanent,
                    shutdown => brutal_kill,
                    type => worker,
                    modules => [trace_exporter]}],
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions
