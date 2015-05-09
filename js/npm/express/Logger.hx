package js.npm.express;


typedef LogOptions = { 
	@:optional var immediate : Bool;
	@:optional var skip : Request->Response-> Bool;
	@:optional var stream : Dynamic;
}

/**
 * Logger
 * @author TiagoLr
 */
extern 
class Logger implements npm.Package.Require < "morgan", "*" > #if !haxe3,#end
implements js.npm.connect.Middleware
{
	public function new(?format:String, ?options:LogOptions) : Void;
	
}