package js.node;

extern class StringDecoder
implements npm.Package.RequireNamespace<"string_decoder","*">
{
    function new(?encoding: String): Void;
    function write(buffer: js.node.Buffer): String;
    function end(): Dynamic;
}