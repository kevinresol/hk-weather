package;

import tink.Json.parse;

@:asserts
class ParserTest {
	public function new() {}
	
	public function uvindex() {
		asserts.assert(parse(('{"uvindex":{"data":[{"place":"京士柏","value":9,"desc":"甚高"}],"recordDesc":"過去一小時"}}':UvIndexObject)).match(Success({uvindex: Data(_)})));
		asserts.assert(parse(('{"uvindex":""}':UvIndexObject)).match(Success({uvindex: Empty})));
		return asserts.done();
	}
}

typedef UvIndexObject = {
	uvindex: hk.Weather.RhrreadUvIndex,
}