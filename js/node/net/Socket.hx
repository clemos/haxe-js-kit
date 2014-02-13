package js.node.net;

import js.node.Net;

typedef SocketOptions = {
  @:optional var fd: Int;
  @:optional var allowHalfOpen: Bool;
  @:optional var readable: Bool;
  @:optional var writable: Bool;
}

/*
  
  Emits:
  connect,data,end,timeout,drain,error,close

  implements a duplex stream interface
*/
extern class Socket 
implements npm.Package.RequireNamespace<"net","*">
extends js.node.events.EventEmitter 
{
    public static inline var EVENT_TIMEOUT = "timeout";
    public static inline var EVENT_CONNECT = "connect";
    public static inline var EVENT_CLOSE = "close";
    public static inline var EVENT_ERROR = "error";
    public static inline var EVENT_DRAIN = "drain";
    public static inline var EVENT_DATA = "data";
    public static inline var EVENT_END = "end";
    
    var remoteAddress:String;
    var remotePort:Int;
    var localAddress: String;
    var localPort: Int;
    var bufferSize:Int;
    var bytesRead:Int;
    var bytesWritten:Int;
                            
    @:overload(function(path:String,?connectListener:Void->Void):Void {})
    function connect(port:Int,?host:String,?connectListener:Void->Void):Void;

    function setEncoding(?encoding:String):Void;
    function setSecure():Void;
    function write(data:Dynamic,?encoding:String,?callback:Void->Void):Bool;
    function end(?data:Dynamic,?encoding:String):Void;
    function destroy():Void;
    function pause():Void;
    function resume():Void;
    function setTimeout(timeout:Int,?callback:Void->Void):Void;
    function setNoDelay(?noDelay:Bool):Void;
    function setKeepAlive(?enable:Bool,?delay:Int):Void;
    function address():js.node.Address;
    function unref(): Void;
    function ref(): Void;
    function new(?options:SocketOptions):Void;
}
