package js.npm.express;
import js.npm.express.Middleware;
import js.support.Callback;

extern class Router 
extends MiddlewareHttp
implements Middleware
implements Dynamic<MiddlewareMethod>
implements npm.Package.RequireNamespace<"express","~4.0">
{
	@:selfCall
	public function new(? option : { ? caseSensitive : Bool, ? mergeParams : Bool, ? strict : Bool }) : Void;

	@:overload(function(path : Route , f : haxe.extern.Rest<AbstractMiddleware>) : Router {})
	@:overload(function (setting : String): Dynamic { } )
	function get(path : Route, f : AbstractMiddleware) : Router;

	function route(path : Route) : MiddlewareRoute;
}