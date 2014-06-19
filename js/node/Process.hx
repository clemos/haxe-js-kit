package js.node;

import js.node.events.EventEmitter;
import js.node.stream.Readable;
import js.node.stream.Writable;

/* 
  Emits:
  exit, uncaughtException + SIGNAL events (SIGINT etc)
 */
extern class Process extends EventEmitter {

  public static inline var EVENT_EXIT = "exit";
  public static inline var EVENT_UNCAUGHTEXCEPTION = "uncaughtException";
  public static inline var EVENT_SIGINT = "SIGINT";
  public static inline var EVENT_SIGUSR1 = "SIGUSR1";
  public static inline var EVENT_SIGBREAK = "SIGBREAK";
  public static inline var EVENT_SIGWINCH = "SIGWINCH";

  var stdout:IWritable;
  var stdin:IReadable;
  var stderr:IWritable;
  var argv:Array<String>;
  var env:Dynamic;
  var pid:Int;
  var title:String;
  var arch:String;
  var platform:String;
  var execPath:String;
  var execArgv:Array<String>;
  var version:String;
  var versions:Dynamic;
  var config:Dynamic;
  var maxTickDepth: Int;
  
  function memoryUsage():{rss:Int,heapUsed:Int,heapTotal:Int};
  function nextTick(fn:Void->Void):Void;
  function exit(code:Int):Void;
  function cwd():String;
  function getuid():Int;
  function getgid():Int;
  function getgroups():Array<Int>;
  function setuid(u:Int):Void;
  function setgid(g:Int):Void;
  function setgroups(groups:Array<Int>):Void;

  @:overload(function(user: Int, extra_group: Int): Void {})
  @:overload(function(user: String, extra_group: Int): Void {})
  @:overload(function(user: Int, extra_group: String): Void {})
  function initgroups(user: String, extra_group: String): Void;

  function umask(?mask:Int):Int;
  function chdir(directory:String):Void;
  function kill(pid:Int,?signal:String):Void;
  function uptime():Int;
  function abort():Void;
  function hrtime():Array<Int>;
}
