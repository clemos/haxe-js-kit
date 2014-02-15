package js.node;

extern class Path 
implements npm.Package.Require<"path","*"> 
{
    public static var sep: String;
    public static var delimiter: String;

    // Need to find a way to add an undefined number of arguments
    static function join(?p1:String,?p2:String,?p3:String):String;
    static function normalize(p:String):String;

    // I don't know how to deal with it, so I let the previous version
    // http://nodejs.org/api/path.html#path_path_resolve_from_to
    static function resolve(from:Array<String>,to:String):String;

    static function relative(from: String, to: String): String;
    static function dirname(p:String):String;
    static function basename(p:String,?ext:String):String;
    static function extname(p:String):String;
}
