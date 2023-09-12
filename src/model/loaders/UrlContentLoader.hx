package model.loaders;

class UrlContentLoader extends Loader {
    public var _url(default, default):String;

    public function new(url:String) {
        super();
        _url = url;
    }

    public override function load():String {
        var http = new haxe.Http(_url);
        var result:String = "";

        http.onData = function (data:String) {
            result = data;
        }

        http.onError = function (error) {
            trace('error: $error');
        }

        http.request();
        return result;
    }
}
