package model.loaders;

import sys.FileSystem;
import sys.io.File;

class FileLoader extends Loader {
	public var _fullFilePath(default, default):haxe.io.Path;

	public function new(fullFilePath:haxe.io.Path) {
        super();
        _fullFilePath = fullFilePath;
	}

	public override function load() : String {
        if (!FileSystem.exists(_fullFilePath.toString())) {
            trace("File doesn't exist");
		    return "";
        }
        
		return File.getContent(_fullFilePath.toString());
	}
}
