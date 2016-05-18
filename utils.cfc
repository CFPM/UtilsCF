component {
	function upperCaseWords(string){
		return ReReplace(string,"\b(\w)","\u\1","ALL")
	}

	function parseQueryString(string){
		var data = {};
		var items = ListToArray(string, '&');
		for(var item in items){
			var split = ListToArray(item, '=');
			data[split[1]] = split[2];
		}
		return data;
	}

	function post(urlString, data={}, headers={}){
		return this.httpCall('POST', urlString, data);
	}

	function get(urlString, data={}, headers={}){
		return this.httpCall('GET', urlString, data);
	}

	function httpCall(method, urlString, data={}, headers={}){
		httpService = new http(method=arguments.method, charset='utf-8', url=arguments.urlString);
		var type = method == 'GET' ? 'URL' : 'formField';
		for(var key in data){
			var value = data[key];
			httpService.addParam(name=key, type=type, value=value);
		}
		for(var key in headers){
			var value = data[key];
			httpService.addParam(name=key, type='header', value=value);
		}
		return httpService.send().getPrefix().Filecontent;
	}

	function time(time='', format=''){
		if(time == ''){
			return DateDiff("s", CreateDate(1970,1,1), Now());
		}
		if(IsValid('integer', time)){
			var date = DateAdd("s", time, CreateDateTime(1970, 1, 1, 0, 0, 0));
			if(format != ''){
				format = format == true ? 'short' : format;
				return dateTimeFormat(date, format);
			}
			return date;
		}
		if(IsValid('time', time)){
			return DateDiff("s", CreateDate(1970,1,1), time);
		}
	}
}