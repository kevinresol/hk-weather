package hk;

import tink.web.proxy.Remote;
import tink.url.Host;

@:forward
abstract WeatherApi(Remote<hk.Weather>) from Remote<hk.Weather> to Remote<hk.Weather> {
	public inline function new(client) {
		this = new Remote<hk.Weather>(client, new RemoteEndpoint(new Host('data.weather.gov.hk', 443)));
	}
}