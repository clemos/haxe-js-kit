package js.node;

extern class Ucs2
{
    function decode(string: String): Array<Int>;
    function encode(codePoints: Array<Int>): String;   
}

extern class Punycode implements npm.Package.Require<"punycode","*">
{
    public static var ucs2: Ucs2;
    public static var version: String;

    static function decode(string: String): String;
    static function encode(string: String): String;
    static function toUnicode(domain: String): String;
    static function toASCII(domain: String): String;
}