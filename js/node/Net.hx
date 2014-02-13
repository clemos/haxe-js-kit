package js.node;

// NetConnectionOpt replaced by TPCSocketOptions
typedef TCPSocketOptions = {
  var port: Int;
  @:optional var host: String;
  @:optional var localAddress: String;
  @:optional var allowHalfOpen: Bool;
}

typedef UNIXsocketOptions = {
  var path: String;
  @:optional var allowHalfOpen: Bool;
}
 
typedef Address = {
  var port: Int;
  var family: String;
  var address: String;
}

/* NET ............................................. */
  
/* 
   Emits:
   connection
*/
extern class Net 
extends js.node.events.EventEmitter 
implements npm.Package.Require<"net","*"> 
{
  static function createServer(?options:{allowHalfOpen:Bool},fn:js.node.net.Socket->Void):js.node.net.Server;

  @:overload(function(path: String, ?connectListener: Void->Void): js.node.net.Socket {}) // Unix socket
  @:overload(function(options: Dynamic, ?connectListener: Void->Void): js.node.net.Socket {}) // options is TPCSocket or UNIXSocket
  static function createConnection(port:Int, ?host:String, ?connectListener: Void->Void):js.node.net.Socket; // TCP Socket

  @:overload(function(path: String, ?connectListener: Void->Void): js.node.net.Socket {}) // Unix socket
  @:overload(function(options: Dynamic, ?connectListener: Void->Void): js.node.net.Socket {}) // options is TPCSocket or UNIXSocket
  static function connect(port:Int, ?host:String, ?connectListener: Void->Void):js.node.net.Socket;

  static function isIP(input:String):Int; // 4 or 6
  static function isIPv4(input:String):Bool;
  static function isIPv6(input:String):Bool;
}

