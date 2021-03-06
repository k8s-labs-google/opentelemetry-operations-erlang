%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.8.0

-ifndef(trace).
-define(trace, true).

-define(trace_gpb_version, "4.8.0").

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.ATTRIBUTES_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.ATTRIBUTES_PB_H', true).
-record('google.devtools.cloudtrace.v2.Span.Attributes',
        {attribute_map = []     :: [{iodata(), trace:'google.devtools.cloudtrace.v2.AttributeValue'()}] | undefined, % = 1
         dropped_attributes_count = 0 :: integer() | undefined % = 2, 32 bits
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.TIMEEVENT_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.TIMEEVENT_PB_H', true).
-record('google.devtools.cloudtrace.v2.Span.TimeEvent',
        {time = undefined       :: trace:'google.protobuf.Timestamp'() | undefined, % = 1
         value                  :: {annotation, trace:'google.devtools.cloudtrace.v2.Span.TimeEvent.Annotation'()} | {message_event, trace:'google.devtools.cloudtrace.v2.Span.TimeEvent.MessageEvent'()} | undefined % oneof
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.TIMEEVENT.MESSAGEEVENT_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.TIMEEVENT.MESSAGEEVENT_PB_H', true).
-record('google.devtools.cloudtrace.v2.Span.TimeEvent.MessageEvent',
        {type = 'TYPE_UNSPECIFIED' :: 'TYPE_UNSPECIFIED' | 'SENT' | 'RECEIVED' | integer() | undefined, % = 1, enum google.devtools.cloudtrace.v2.Span.TimeEvent.MessageEvent.Type
         id = 0                 :: integer() | undefined, % = 2, 32 bits
         uncompressed_size_bytes = 0 :: integer() | undefined, % = 3, 32 bits
         compressed_size_bytes = 0 :: integer() | undefined % = 4, 32 bits
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.TIMEEVENT.ANNOTATION_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.TIMEEVENT.ANNOTATION_PB_H', true).
-record('google.devtools.cloudtrace.v2.Span.TimeEvent.Annotation',
        {description = undefined :: trace:'google.devtools.cloudtrace.v2.TruncatableString'() | undefined, % = 1
         attributes = undefined :: trace:'google.devtools.cloudtrace.v2.Span.Attributes'() | undefined % = 2
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.TIMEEVENTS_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.TIMEEVENTS_PB_H', true).
-record('google.devtools.cloudtrace.v2.Span.TimeEvents',
        {time_event = []        :: [trace:'google.devtools.cloudtrace.v2.Span.TimeEvent'()] | undefined, % = 1
         dropped_annotations_count = 0 :: integer() | undefined, % = 2, 32 bits
         dropped_message_events_count = 0 :: integer() | undefined % = 3, 32 bits
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.LINK_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.LINK_PB_H', true).
-record('google.devtools.cloudtrace.v2.Span.Link',
        {trace_id = []          :: iodata() | undefined, % = 1
         span_id = []           :: iodata() | undefined, % = 2
         type = 'TYPE_UNSPECIFIED' :: 'TYPE_UNSPECIFIED' | 'CHILD_LINKED_SPAN' | 'PARENT_LINKED_SPAN' | integer() | undefined, % = 3, enum google.devtools.cloudtrace.v2.Span.Link.Type
         attributes = undefined :: trace:'google.devtools.cloudtrace.v2.Span.Attributes'() | undefined % = 4
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.LINKS_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN.LINKS_PB_H', true).
-record('google.devtools.cloudtrace.v2.Span.Links',
        {link = []              :: [trace:'google.devtools.cloudtrace.v2.Span.Link'()] | undefined, % = 1
         dropped_links_count = 0 :: integer() | undefined % = 2, 32 bits
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.SPAN_PB_H', true).
-record('google.devtools.cloudtrace.v2.Span',
        {name = []              :: iodata() | undefined, % = 1
         span_id = []           :: iodata() | undefined, % = 2
         parent_span_id = []    :: iodata() | undefined, % = 3
         display_name = undefined :: trace:'google.devtools.cloudtrace.v2.TruncatableString'() | undefined, % = 4
         start_time = undefined :: trace:'google.protobuf.Timestamp'() | undefined, % = 5
         end_time = undefined   :: trace:'google.protobuf.Timestamp'() | undefined, % = 6
         attributes = undefined :: trace:'google.devtools.cloudtrace.v2.Span.Attributes'() | undefined, % = 7
         stack_trace = undefined :: trace:'google.devtools.cloudtrace.v2.StackTrace'() | undefined, % = 8
         time_events = undefined :: trace:'google.devtools.cloudtrace.v2.Span.TimeEvents'() | undefined, % = 9
         links = undefined      :: trace:'google.devtools.cloudtrace.v2.Span.Links'() | undefined % = 10
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.ATTRIBUTEVALUE_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.ATTRIBUTEVALUE_PB_H', true).
-record('google.devtools.cloudtrace.v2.AttributeValue',
        {value                  :: {string_value, trace:'google.devtools.cloudtrace.v2.TruncatableString'()} | {int_value, integer()} | {bool_value, boolean() | 0 | 1} | undefined % oneof
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.STACKTRACE.STACKFRAME_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.STACKTRACE.STACKFRAME_PB_H', true).
-record('google.devtools.cloudtrace.v2.StackTrace.StackFrame',
        {function_name = undefined :: trace:'google.devtools.cloudtrace.v2.TruncatableString'() | undefined, % = 1
         original_function_name = undefined :: trace:'google.devtools.cloudtrace.v2.TruncatableString'() | undefined, % = 2
         file_name = undefined  :: trace:'google.devtools.cloudtrace.v2.TruncatableString'() | undefined, % = 3
         line_number = 0        :: integer() | undefined, % = 4, 32 bits
         column_number = 0      :: integer() | undefined, % = 5, 32 bits
         load_module = undefined :: trace:'google.devtools.cloudtrace.v2.Module'() | undefined, % = 6
         source_version = undefined :: trace:'google.devtools.cloudtrace.v2.TruncatableString'() | undefined % = 7
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.STACKTRACE.STACKFRAMES_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.STACKTRACE.STACKFRAMES_PB_H', true).
-record('google.devtools.cloudtrace.v2.StackTrace.StackFrames',
        {frame = []             :: [trace:'google.devtools.cloudtrace.v2.StackTrace.StackFrame'()] | undefined, % = 1
         dropped_frames_count = 0 :: integer() | undefined % = 2, 32 bits
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.STACKTRACE_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.STACKTRACE_PB_H', true).
-record('google.devtools.cloudtrace.v2.StackTrace',
        {stack_frames = undefined :: trace:'google.devtools.cloudtrace.v2.StackTrace.StackFrames'() | undefined, % = 1
         stack_trace_hash_id = 0 :: integer() | undefined % = 2, 32 bits
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.MODULE_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.MODULE_PB_H', true).
-record('google.devtools.cloudtrace.v2.Module',
        {module = undefined     :: trace:'google.devtools.cloudtrace.v2.TruncatableString'() | undefined, % = 1
         build_id = undefined   :: trace:'google.devtools.cloudtrace.v2.TruncatableString'() | undefined % = 2
        }).
-endif.

-ifndef('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.TRUNCATABLESTRING_PB_H').
-define('GOOGLE.DEVTOOLS.CLOUDTRACE.V2.TRUNCATABLESTRING_PB_H', true).
-record('google.devtools.cloudtrace.v2.TruncatableString',
        {value = []             :: iodata() | undefined, % = 1
         truncated_byte_count = 0 :: integer() | undefined % = 2, 32 bits
        }).
-endif.

-ifndef('GOOGLE.PROTOBUF.TIMESTAMP_PB_H').
-define('GOOGLE.PROTOBUF.TIMESTAMP_PB_H', true).
-record('google.protobuf.Timestamp',
        {seconds = 0            :: integer() | undefined, % = 1, 32 bits
         nanos = 0              :: integer() | undefined % = 2, 32 bits
        }).
-endif.

-endif.
