package model;

import model.loaders.Loader;

// Strategy pattern
class XmlLoader {
    var _loaderMethod:Loader;

    public function new(loaderMethod:Loader) {
        _loaderMethod = loaderMethod;
    }

    public function load() : Xml {
        var loadedData:String = _loaderMethod.load();
        trace(loadedData);
        return Xml.parse(loadedData);
    }
}
