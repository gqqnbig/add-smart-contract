Add=require("./build/contracts/Add.json")

module.exports = function(callback) {
	let abi=Add['abi'];
	let bytecode=Add['bytecode'];

	web3.eth.personal.getAccounts().then(accounts=> {
		let account0=accounts[0];

		c = new web3.eth.Contract(j);
		c.deploy({data:bytecode, arguments:[4]}).send({from: account0, gas:1500000, gasPrice: '30000000000000'});
	});
}
