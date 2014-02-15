package js.node;

extern class Path 
implements npm.Package.Require<"path","*"> 
{
    public static var sep: String;
    public static var delimiter: String;

    static inline function join(paths: Array<String>):String {
        return untyped Path['resolve'].apply(Path, paths);
    }

    static function normalize(p:String):String;

    static inline function resolve(?from:Array<String>, to: String):String {
        if (null == from) {
            from = new Array<String>();
        }

        var args = from;
        args.push(to);

        return untyped Path['resolve'].apply(Path, args);
    }

    static function relative(from: String, to: String): String;
    static function dirname(p:String):String;
    static function basename(p:String,?ext:String):String;
    static function extname(p:String):String;
}
