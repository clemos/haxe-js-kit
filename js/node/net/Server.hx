package js.node.net;

import js.node.Net;

/* 
   Emits:
   connection,close,error,listening
*/
extern class Server 
extends js.node.events.EventEmitter 
implements npm.Package.RequireNamespace<"net","*">
{
  public static inline var EVENT_CONNECTION = "connection";
  public static inline var EVENT_CLOSE = "close";
  public static inline var EVENT_LISTENING = "listening";
  public static inline var EVENT_ERROR = "error";

  var maxConnections:Int;

  // @DEPRECATED
  var connections:Int;

  @:overload(function(path:String,?callback:Void->Void):Void {})
  @:overload(function(fd:Int,?callback:Void->Void):Void {})                        
  function listen(port:Int,?host:String, ?backlog: Int, ?callback:Void->Void):Void;
  function close(callback:Void->Void):Void;
  function address(): js.node.Address;
  function unref(): Void;
  function ref(): Void;
  function getConnections(callback: String->Int->Void): Void;

}