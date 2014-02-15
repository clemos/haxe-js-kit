package js.node;

typedef UrlObj = {
  var href:String;
  var host:String;
  var protocol:String;
  var auth:String;
  var hostname:String;
  var port:String;
  var pathname:String;
  var path:String;
  var search:String;
  var query:Dynamic;
  var hash:String;
}

extern class Url 
implements npm.Package.Require<"url","*"> 
{
  static function parse(urlStr:String,?parseQueryString:Bool, slashesDenoteHost: Bool):UrlObj;
  static function format(o:UrlObj):String;
  static function resolve(from:String,to:String):String;
}