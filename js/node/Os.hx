package js.node;

typedef TimesInformations = {
  var user: Int;
  var nice: Int;
  var sys: Int;
  var idle: Int;
  var irq: Int;
}

typedef CPUInformations = {
  var model: String;
  var speed: Int;
  var times: TimesInformations;
}

typedef NetworkInterface = {
  var address: String;
  var family: String;
  var internal: Bool;
}

extern class Os 
implements npm.Package.Require<"os","*"> 
{
  public static var EOL: String;

  static function tmpdir(): String;
  static function endianness(): String;
  static function hostname():String;
  static function type():String;
  static function release():String;
  static function uptime():Int;
  static function loadavg():Array<Float>;
  static function totalmem():Int;
  static function freemem():Int;
  static function cpus(): CPUInformations;
  static function platform():String;
  static function arch():String;
  static function networkInterfaces(): haxe.ds.StringMap<NetworkInterface>;
}