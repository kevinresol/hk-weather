package;

import tink.Json.parse;

@:asserts
class ParserTest {
	public function new() {}
	
	public function uvindex() {
		asserts.assert(parse(('{"uvindex":{"data":[{"place":"京士柏","value":9,"desc":"甚高"}],"recordDesc":"過去一小時"}}':UvIndexObject)).match(Success({uvindex: {data: _, recordDesc: _}})));
		asserts.assert(parse(('{"uvindex":""}':UvIndexObject)).match(Success({uvindex: null})));
		return asserts.done();
	}
}

typedef UvIndexObject = {
	uvindex: tink.json.EmptyStringAsNull<{
		data:Array<{place:String, value:Int, desc:String}>,
		recordDesc:String,
	}>,
}