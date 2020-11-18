package hk;

import tink.web.proxy.Remote;
import tink.url.Host;

@:forward
abstract WeatherApi(Remote<hk.Weather>) from Remote<hk.Weather> to Remote<hk.Weather> {
	public inline function new() {
		this = tink.Web.connect(('https://data.weather.gov.hk':Weather));
	}
}