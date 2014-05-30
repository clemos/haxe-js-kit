package js.npm.express;

typedef StaticOptions = {
  ?maxAge : Int,
  ?hidden : Bool,
  ?redirect : Bool
}

@:native('static')
extern class Static 
implements npm.Package.RequireNamespace<"express","*"> #if !haxe3,#end
implements js.npm.connect.Middleware
{
  public function new( path : String , ?opts : StaticOptions ) : Void;
}