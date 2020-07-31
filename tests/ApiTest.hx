package;

import tink.http.clients.*;

@:asserts
class ApiTest {
	public function new() {}
	
	public function rhrread() {
		
		var api = new hk.WeatherApi(new SecureNodeClient());
		
		api.rhrread('tc').handle(function(o) switch o {
			case Success(data):
				var date:Date = data.updateTime;
				trace(data);
				asserts.done();
			case Failure(e):
				asserts.fail(e);
		});
		
		return asserts;
	} 
	
	public function fnd() {
		
		var api = new hk.WeatherApi(new SecureNodeClient());
		
		api.fnd('tc').handle(function(o) switch o {
			case Success(data):
				var date:Date = data.updateTime;
				trace(data);
				asserts.done();
			case Failure(e):
				asserts.fail(e);
		});
		
		return asserts;
	} 
		
}