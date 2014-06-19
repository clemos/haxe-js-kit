package js.node;

import js.node.stream.Readable;
import js.node.stream.Writable;
import js.node.events.EventEmitter;

typedef InterfaceOptions = {
    var input: Readable;
    var output: Writable;
    @:optional var completer: String->?Dynamic->Dynamic;
    @:optional var terminal: Bool;
}

extern class Interface extends EventEmitter
{
    function setPrompt(prompt: String, ?length: Int): Void;
    function prompt(?preserverCursor: Bool): Void;
    function question(query: String, callback: String->Void): Void;
    function pause(): Void;
    function resume(): Void;
    function close(): Void;
    function write(data: Dynamic, ?key: Dynamic): Void;
}

extern class Readline 
extends EventEmitter 
implements npm.Package.Require<"readline","*">
{
    public static inline var EVENT_LINE = "line";
    public static inline var EVENT_PAUSE = "pause";
    public static inline var EVENT_RESUME = "resume";
    public static inline var EVENT_CLOSE = "close";
    public static inline var EVENT_SIGINT = "SIGINT";
    public static inline var EVENT_SIGTSTP = "SIGTSTP";
    public static inline var EVENT_SIGCONT = "SIGCONT";

    static function createInterface(options: InterfaceOptions): Interface;
}