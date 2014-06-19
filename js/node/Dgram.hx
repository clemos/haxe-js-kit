package js.node;

import haxe.io.Bytes;
import js.node.events.EventEmitter;
import js.support.Callback;

/* UDP ........................................ */

typedef Address = {
  var address: String;
  var family: String;
  var port: Int;
}

/* 
   Emits: message,listening,close
*/
extern class DgramSocket extends EventEmitter
{
  public static inline var EVENT_MESSAGE = 'message';
  public static inline var EVENT_LISTENING = 'listening';
  public static inline var EVENT_CLOSE = 'close';
  public static inline var EVENT_ERROR = 'error';

  function send(buf:Buffer,offset:Int,length:Int,port:Int,address:String,?cb:String->Array<Bytes>->Void):Void;
  function bind(port:Int,?address:String, ?callback: Void->Void):Void;
  function close():Void;
  function address():Dynamic;
  function setBroadcast(flag:Bool):Void;
  function setTTL(ttl:Int):Void;
  function setMulticastTTL(ttl:Int):Void;
  function setMulticastLoopback(flag:Bool):Void;
  function addMembership(multicastAddress:String,?multicastInterface:String):Void;
  function dropMembership(multicastAddress:String,?multicastInterface:String):Void;
  function unref(): Void;
  function ref(): Void;
}

extern class Dgram
implements npm.Package.Require<"dgram","*"> {
  // Valid types: udp6, and unix_dgram.
  public static function createSocket(type:String,?cb:Callback<Bytes>):DgramSocket;
}
