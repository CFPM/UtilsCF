component {

	function init(){
		this.cfpm = new cfpm();
		this.request = this.cfpm.require('request');
		return this;
	}


	function upperCaseWords(string){
		return ReReplace(string,"\b(\w)","\u\1","ALL");
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
			if(format != ''){
				format = format == true ? 'short' : format;
				return dateTimeFormat(time, format);
			}
			var timestamp = DateDiff("s", CreateDate(1970,1,1), time);
			return timestamp;
		}
	}

	function sortArrayofStructs(array, key, order='asc'){
		var keys = [];
		var type = 'text';
		for(var record in array){
			type = isNumeric(record[key]) ? 'numeric' : type;
			ArrayAppend(keys, record[key]);
		}
		ArraySort(keys, type, order);
		var sortedArray = [];
		for(var index in keys){
			for(var record in array){
				if(index == record[key]){
					ArrayAppend(sortedArray, record);
				}
			}
		}
		return sortedArray;
	}
}