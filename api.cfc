component {
	public function init(){
		return this;
	}
	public function post(requestURL, params={}, headers={}, body=''){
		createService('POST', requestURL);
		addParams(params, 'formField');
		addHeaders(headers);
		addBody(body);
		var response = sendRequest();
		destroyService();
		return response;
	}
	public function get(requestURL, params={}, headers={}){
		createService('GET', requestURL);
		addParams(params, 'URL');
		addHeaders(headers);
		var response = sendRequest();
		destroyService();
		return response;
	}

	private function createService(method, requestURL){
		this.httpService = new http(method=method, url=requestURL);
	}

	private function addParams(params={}, type){
		for(key in params){
			this.httpService.addParam(type=type, name=key, value=params[key]);
		}
	}

	private function addHeaders(headers={}){
		for(key in headers){
			this.httpService.addParam(type='header', name=key, value=headers[key]);
		}
	}

	private function addBody(body=''){
		if(trim(body) != ''){
			this.httpService.addParam(type='body', value=trim(body));
		}
	}

	private function sendRequest(){
		var result = this.httpService.send().getPrefix();
		if(left(result.statuscode, 2) == '20'){
			try{
				var results = deserializeJSON(result.filecontent);
			}catch(any e){
				try{
					var results = application.udfs.XMLSafeParse(result.filecontent);
				}catch(any e){
					var results = result.filecontent;
				}
			}
			return results;
		}else{
			throw('Received status #result.statuscode# for curl request');
		}
	}

	private function destroyService(){
		this.httpService = '';
	}
}