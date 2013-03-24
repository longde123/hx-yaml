package yaml;

import yaml.Renderer;
import yaml.Parser;

class Yaml
{
	/**
	Parse a yaml document into object form.
	 
	@param document     The yaml document to parse.
	@param ?options     Parsing options (optional).
	 
	@return The parsed yaml document in object form.
	*/
	public static function parse(document:String, ?options:ParserOptions):Dynamic
	{
		if (options == null) options = new ParserOptions();
		return new Parser().parse(document, options);
	}

	#if sys
	/**
	Read a yaml document from disk and parse it into object form.
	
	@param filePath     The path to read the yaml file.
	@param ?options     Parsing options (optional).
	
	@return The parsed yaml document in object form.
	*/
	public static function read(filePath:String, ?options:ParserOptions):Dynamic
	{
		return parse(msys.File.read(filePath), options);
	}
	#end

	/**
	Render a yaml object graph as a yaml document.
	
	@param data         The root object to render.
	@param ?options     Rendering options (optional).
	
	@return The rendered yaml document.
	*/
	public static function render(data:Dynamic, ?options:RenderOptions):String
	{
		if (options == null) options = new RenderOptions();
		return new Renderer().render(data, options);
	}

	#if sys
	/**
	Render an object graph as a yaml document and then write it to disk.
	
	@param data         The root object to render.
	@param filePath     The path to write the yaml file.
	@param ?options     Rendering options (optional).
	*/
	public static function write(data:Dynamic, filePath:String, ?options:RenderOptions):Void
	{
		msys.File.write(filePath, render(data, options));
	}
	#end
	
    private function new() {}
}
