package js.npm.mongoose;

import js.support.Callback;
import js.support.Error;

typedef ModelUpdateOptions = {
	?safe: Bool,
	?upsert: Bool,
	?multi: Bool,
	?strict: Bool,
	?overwrite: Bool,
	?runValidators:Bool
}

typedef ModelUpdateCallback = Callback1<{
	ok:Int,
	?nModified:Int,
	n:Int
}>;

@:native("Model")
extern class TModel<T>
extends Document<T>
implements npm.Package.RequireNamespace<"mongoose","^4.0.0"> 
{

	public var db : Connection;
	public var collection : Dynamic;//Collection;
	public var modelName : String;
	
	@:overload(function(): Void {})
	@:overload(function(fn: Callback2<TModel<T>, Int>): Void {})
	public function save( fn : Callback<TModel<T>> ) : Void;
	public function increment() : TModel<T>;
	public function remove( ?fn : Callback<TModel<T>> ) : TModel<T>;

	public function model<T,M:TModel<T>>( name : String ) : TModels<T,M>;
	
}

// just add a helper to type models a minimum
extern class Model<T>
extends TModel<T> {
	public var _ (get,null) : T;
	inline private function get__() : T return untyped this;
}

extern typedef Models<T> = TModels<T,Model<T>>;

@:native("{}")
extern class TModels<T,M:TModel<T>> {
	public var db : Connection;
	public var collection : Dynamic;//Collection;
	public var modelName : String;
	public var schema : Schema<T>;
	public var base : Mongoose;
	
	public function ensureIndexes( ?fn : Callback0 ) : Void;
	public function remove( conditions : {} , callback : Callback0 ) : Void;

	@:overload( function ( conditions : {} , fields : String , callback : Callback<Array<M>> ): Query<Array<M>> {} )
	@:overload( function ( conditions : {} , fields : String , options : {} , ?callback : Callback<Array<Model<T>>> ): Query<Array<M>> {} )
	@:overload( function ( conditions : {} , fields : Null<{}> , options : {} , ?callback : Callback<Array<M>> ): Query<Array<M>> {} )
	public function find( ?conditions : {} , ?callback : Callback<Array<M>> ): Query<Array<M>>; // Query<Model<T>>

	@:overload( function( id : Dynamic , callback : Callback<Null<M>> ) : Void {} )
	@:overload( function ( id : Dynamic , fields : String , options : {} , ?callback : Callback<Null<M>> ): Query<Model<T>> {} )
	@:overload( function ( id : Dynamic , fields : Null<{}> , options : {} , ?callback : Callback<Null<M>> ): Query<Model<T>> {} )
	public function findById( id : Dynamic ): Query<Model<T>>; // Query<Model<T>>

	@:overload( function( conditions : {} , callback : Callback<Null<M>> ) : Void {} )
	@:overload( function ( conditions : {}  , fields : String , options : {} , ?callback : Callback<Null<M>> ): Query<M> {} )
	@:overload( function ( conditions : {} , fields : Null<{}> , options : {} , ?callback : Callback<Null<M>> ): Query<M> {} )
	public function findOne( ?conditions : {} ): Query<M>; // Query<M>

	@:overload( function ( conditions : {} , ?callback : Callback<Int> ): Query<M> {} )// Query<M>
	public function count( callback : Callback<Int> ): Query<M>; // Query<M>

	@:overload( function ( field : String ): Query<M> {} )// Query<M>
	@:overload( function ( field : String , conditions : {} , callback : Callback<Array<M>> ): Query<M> {} )// Query<M>
	@:overload( function ( field : String , conditions : {} ): Query<M> {} )// Query<M>
	public function distinct( field : String , callback : Callback<Array<M>> ): Query<M>; // Query<M>

	public function where( field : String , ?val : Dynamic ) : Query<Array<M>>;

	@:overload( function( conditions : Void->Bool ) : Query<Array<M>> {} )
	public inline function _where( conditions : String ) : Query<Array<M>> return untyped this["$where"](conditions);

	@:overload( function( ) : Query<M> {} )
	@:overload( function( conditions : {} , update : {} , options : {} , callback : Callback<Null<M>> ) : Query<M> {} )
	@:overload( function( conditions : {} , update : {} , options : {} ) : Query<M> {} )
	@:overload( function( conditions : {} , update : {} ) : Query<M> {} )
	public function findOneAndUpdate( conditions : {} , update : {} , callback : Callback<Null<M>> ) : Query<M>;

	@:overload( function( ) : Query<M> {} )
	@:overload( function( id : Dynamic , update : {} , options : {} , callback : Callback<Null<M>> ) : Query<M> {} )
	@:overload( function( id : Dynamic , update : {} , options : {} ) : Query<M> {} )
	@:overload( function( id : Dynamic , update : {} ) : Query<M> {} )
	public function findByIdAndUpdate( id : Dynamic , update : {} , callback : Callback<Null<M>> ) : Query<M>;

	@:overload( function( conditions : {} , options : {} , callback : Callback<Null<M>> ) : Query<M> {} )
	@:overload( function( conditions : {} , options : {} ) : Query<M> {} )
	@:overload( function( ?conditions : {} ) : Query<M> {} )
	public function findOneAndRemove( conditions : {} , callback : Callback<Null<M>> ) : Query<M>;

	@:overload( function( id : Dynamic , options : {} , callback : Callback<Null<M>> ) : Query<M> {} )
	@:overload( function( id : Dynamic , options : {} ) : Query<M> {} )
	@:overload( function( ?id : Dynamic ) : Query<M> {} )
	public function findByIdAndRemove( id : Dynamic , callback : Callback<Null<M>> ) : Query<M>;

	@:overload( function( doc : Array<T> , fn : Callback<Array<M>> ) : Void {} )
	public function create( doc:T , fn : Callback<M> /* TODO : maybe there's a solution for multiple arguments... */  ) : Void;
	
	@:overload( function( conditions : {} , update : {} , callback : ModelUpdateCallback ) : Query<Array<M>> {} )
	@:overload( function( conditions : {} , update : {} , options : ModelUpdateOptions ) : Query<Array<M>> {} )
	@:overload( function( conditions : {} , update : {} ) : Query<Array<M>> {} )
	public function update( conditions : {} , update : {} , options : ModelUpdateOptions , callback : ModelUpdateCallback ) : Query<Array<M>>;

	public function mapReduce( o : ModelMapReduce , callback : Callback2<Array<M>,{}> ) : Void;

	@:overload( function( c1 : {} , c2 : {} , c3 : {} , options : {} , callback : Callback<Array<{}>> ) : Void {} )
	@:overload( function( c1 : {} , c2 : {} , options : {} , callback : Callback<Array<{}>> ) : Void {} )
	@:overload( function( commands : {} , options : {} , callback : Callback<Array<{}>> ) : Void {} )
	public function aggregate( commands : {} , callback : Callback<Array<{}>> ) : Void;

	@:overload(function( doc : {} , options : {} , cb : Callback<M> ) : Void {} )
	public function populate( docs : Array<{}> , options : {} , cb : Callback<Array<M>> ) : Void;

	public inline function construct( ?doc : T ) : M {
		return untyped __new__(this,doc);
	}

}

typedef ModelMapReduce = {
	map : Void->Void,
	reduce : String->Array<Dynamic>->Void,
	?query : {},
	?limit : Int,
	?keeptemp : Bool,
	?finalize : Void->Void,
	?scope : {},
	?jsMode : Bool,
	?verbose : Bool,
	?out : {}
}
