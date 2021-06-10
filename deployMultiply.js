Multiply=require("./build/contracts/Multiply.json");

module.exports = function(callback) {
	let abi=Multiply['abi'];
	let bytecode=Multiply['bytecode'];

	web3.eth.personal.getAccounts().then(accounts=> {
		let account0=accounts[0];

		let c = new web3.eth.Contract(abi);
		c.deploy({data:bytecode, arguments:[5]})
			.send({from: account0, gas:1500000, gasPrice: '30000000000000'})
			.then(function(newContractInstance){
    			console.log('Contract is deployed at ' + newContractInstance.options.address);
				//Use Add.at("the address")
				//to retrieve the instance.
				//Note, the at() method is provided from truffle console.
			});
	});
};
