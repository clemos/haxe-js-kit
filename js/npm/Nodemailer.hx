package js.npm;

import js.npm.nodemailer.Transport;
import js.npm.nodemailer.Transporter;

// https://github.com/andris9/nodemailer-smtp-transport
typedef NodemailerOptions = {
	?service: String,
	?port : Int, // is the port to connect to (defaults to 25 or 465)
	?host : String, // is the hostname or IP address to connect to (defaults to 'localhost')
	?secure : Bool, // defines if the connection should use SSL (if true) or not (if false)
	?auth : { // defines authentication data (see authentication section below)
		?user : String,
		?pass : String,
		?xoauth2: String
	},
	?ignoreTLS : Bool, // turns off STARTTLS support if true
	?name : String, // optional hostname of the client, used for identifying to the server
	?localAddress : String, // is the local interface to bind to for network connections
	?connectionTimeout : Int, // how many milliseconds to wait for the connection to establish
	?greetingTimeout : Int, // how many milliseconds to wait for the greeting after connection is established
	?socketTimeout : Int, // how many milliseconds of inactivity to allow
	?debug : Bool, // if true, the connection emits all traffic between client and server as 'log' events
	?authMethod : String, // defines preferred authentication method, eg. 'PLAIN'
	?tls : Dynamic // defines additional options to be passed to the socket constructor, eg. {rejectUnauthorized: true}
}

extern class Nodemailer
implements npm.Package.Require<"nodemailer", "^1.3.4">
{
	//@:overload(function(transport : Transport) : Transporter {})
	@:overload(function(connectionUrl : String) : Transporter {})
	public static function createTransport(?options : NodemailerOptions) : Transporter;
}
