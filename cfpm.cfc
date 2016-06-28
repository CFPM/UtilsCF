component {
	public function init(package = '', params = {}){
		this.packages = {};
		return this;
	}

	public function require(package, params = {}){
		var packageClass = 'vendor.' & package & '.' & package;
		try{
			if(!StructKeyExists(this.packages, package)){
				this.packages[package] = new "#packageClass#"(params);
			}
			return this.packages[package];
		}catch(any e){
			throw 'Package: "#package#" not found';
		}
	}
}