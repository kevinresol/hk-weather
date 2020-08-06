package;

import tink.Json.parse;
import hk.Weather;

@:asserts
class ParserTest {
	public function new() {}
	
	public function rhrread() {
		asserts.assert(parse(('{"rainfall":{"data":[{"unit":"mm","place":"Central &amp; Western District","max":0,"main":"FALSE"},{"unit":"mm","place":"Eastern District","max":0,"main":"FALSE"},{"unit":"mm","place":"Kwai Tsing","max":0,"main":"FALSE"},{"unit":"mm","place":"Islands District","max":0,"main":"FALSE"},{"unit":"mm","place":"North District","max":0,"main":"FALSE"},{"unit":"mm","place":"Sai Kung","max":1,"min":0,"main":"FALSE"},{"unit":"mm","place":"Sha Tin","max":0,"main":"FALSE"},{"unit":"mm","place":"Southern District","max":0,"main":"FALSE"},{"unit":"mm","place":"Tai Po","max":0,"main":"FALSE"},{"unit":"mm","place":"Tsuen Wan","max":0,"main":"FALSE"},{"unit":"mm","place":"Tuen Mun","max":0,"main":"FALSE"},{"unit":"mm","place":"Wan Chai","max":0,"main":"FALSE"},{"unit":"mm","place":"Yuen Long","max":0,"main":"FALSE"},{"unit":"mm","place":"Yau Tsim Mong","max":0,"main":"FALSE"},{"unit":"mm","place":"Sham Shui Po","max":0,"main":"FALSE"},{"unit":"mm","place":"Kowloon City","max":0,"main":"FALSE"},{"unit":"mm","place":"Wong Tai Sin","max":0,"main":"FALSE"},{"unit":"mm","place":"Kwun Tong","max":0,"main":"FALSE"}],"startTime":"2020-08-06T08:45:00+08:00","endTime":"2020-08-06T09:45:00+08:00"},"icon":[54],"iconUpdateTime":"2020-08-06T06:00:00+08:00","specialWxTips":["Hot weather might cause adverse health effects. The public should stay on the alert and drink more water."],"uvindex":{"data":[{"place":"King\'s Park","value":5,"desc":"moderate"}],"recordDesc":"During the past hour"},"updateTime":"2020-08-06T10:02:00+08:00","temperature":{"data":[{"place":"King\'s Park","value":30,"unit":"C"},{"place":"Hong Kong Observatory","value":29,"unit":"C"},{"place":"Wong Chuk Hang","value":31,"unit":"C"},{"place":"Ta Kwu Ling","value":30,"unit":"C"},{"place":"Lau Fau Shan","value":28,"unit":"C"},{"place":"Tai Po","value":29,"unit":"C"},{"place":"Sha Tin","value":30,"unit":"C"},{"place":"Tuen Mun","value":29,"unit":"C"},{"place":"Tseung Kwan O","value":29,"unit":"C"},{"place":"Sai Kung","value":30,"unit":"C"},{"place":"Cheung Chau","value":28,"unit":"C"},{"place":"Chek Lap Kok","value":31,"unit":"C"},{"place":"Tsing Yi","value":31,"unit":"C"},{"place":"Shek Kong","value":31,"unit":"C"},{"place":"Tsuen Wan Ho Koon","value":28,"unit":"C"},{"place":"Tsuen Wan Shing Mun Valley","value":30,"unit":"C"},{"place":"Hong Kong Park","value":31,"unit":"C"},{"place":"Shau Kei Wan","value":29,"unit":"C"},{"place":"Kowloon City","value":31,"unit":"C"},{"place":"Happy Valley","value":31,"unit":"C"},{"place":"Wong Tai Sin","value":30,"unit":"C"},{"place":"Stanley","value":30,"unit":"C"},{"place":"Kwun Tong","value":31,"unit":"C"},{"place":"Sham Shui Po","value":31,"unit":"C"},{"place":"Yuen Long Park","value":31,"unit":"C"},{"place":"Tai Mei Tuk","value":28,"unit":"C"}],"recordTime":"2020-08-06T10:00:00+08:00"},"warningMessage":"","mintempFrom00To09":"","rainfallFrom00To12":"","rainfallLastMonth":"","rainfallJanuaryToLastMonth":"","tcmessage":"","humidity":{"recordTime":"2020-08-06T10:00:00+08:00","data":[{"unit":"percent","value":86,"place":"Hong Kong Observatory"}]}}':RhrreadData)).isSuccess());
		return asserts.done();
	}
	
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