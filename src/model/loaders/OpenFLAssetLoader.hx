package model.loaders;

import openfl.Assets;

class OpenFLAssetLoader extends Loader {
	public var _assetPath(default, default):String;

	public function new(assetPath:String) {
        super();
        _assetPath = assetPath;
	}

	public override function load() : String {
        
        if (!Assets.exists(_assetPath)) {
            trace("File doesn't exist");
		    return "";
        }
        
		return Assets.getText(_assetPath);
	}
}
