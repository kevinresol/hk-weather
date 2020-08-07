package hk;

import tink.json.EmptyStringAsNull;

interface Weather {
	@:get('/weatherAPI/opendata/weather.php?dataType=rhrread&lang=$lang')
	function rhrread(lang:String):RhrreadData;
	
	@:get('/weatherAPI/opendata/weather.php?dataType=fnd&lang=$lang')
	function fnd(lang:String):FndData;
}

// https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=rhrread&lang=tc


abstract WeatherDate(String) from String to String {
	@:to
	public function toDate():Date {
		return js.Syntax.code('new Date({0})', this);
	}
}
abstract YYYYMMDD(String) from String to String {
}

typedef RhrreadData = {
	?lightning: {
		data:Array<{place:String, occur:String}>,
		startTime:WeatherDate,
		endTime:WeatherDate,
	},
	rainfall: {
		data: Array<{unit:String, place:String, max:Int, ?min:Int, main:String}>,
		startTime:WeatherDate,
		endTime:WeatherDate,
	},
	warningMessage:EmptyStringAsNull<Array<String>>,
	icon:Array<Int>,
	iconUpdateTime:WeatherDate,
	uvindex:EmptyStringAsNull<{
		data:Array<{place:String, value:Int, desc:String}>,
		recordDesc:String,
	}>,
	updateTime:WeatherDate,
	temperature: {
		data:Array<{place:String, value:Int, unit:String}>,
		recordTime:WeatherDate,
	},
	tcmessage:EmptyStringAsNull<Array<String>>,
	mintempFrom00To09:EmptyStringAsNull<Dynamic>,
	rainfallFrom00To12:EmptyStringAsNull<String>,
	rainfallLastMonth:EmptyStringAsNull<String>,
	rainfallJanuaryToLastMonth:EmptyStringAsNull<String>,
	humidity: {
		recordTime:WeatherDate,
		data:Array<{unit:String, value:Int, place:String}>,
	},
}


typedef FndData = {
	generalSituation:String,
	weatherForecast:Array<{
		forecastDate:YYYYMMDD,
		week:String,
		forecastWind:String,
		forecastWeather:String,
		forecastMaxtemp:{value:Int, unit:String},
		forecastMintemp:{value:Int, unit:String},
		forecastMaxrh:{value:Int, unit:String},
		forecastMinrh:{value:Int, unit:String},
		ForecastIcon:Int,
	}>,
	updateTime:WeatherDate,
	seaTemp: {
		place:String,
		value:Int,
		unit:String,
		recordTime:WeatherDate,
	},
	soilTemp:Array<{
		place:String,
		value:Float,
		unit:String,
		recordTime:WeatherDate,
		depth:{unit:String, value:Float},
	}>,
}
