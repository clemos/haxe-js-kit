package js.npm.express;

/**
 * Favicon
 * @author TiagoLr
 */
extern
class Favicon implements npm.Package.Require < "serve-favicon", "*" > #if !haxe3,#end
implements js.npm.connect.Middleware {

	public function new(iconPath:String) : Void;
	
}