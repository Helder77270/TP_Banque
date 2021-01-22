var Banque = artifacts.require("Banque");

/*
	We used asymetric function to be sure to get the contract ABI in LoteryContract.
	In this way we can get LoteryContract address to set it in the Main.sol contract
 */

module.exports = async function(deployer, networks, accounts) {
	await deployer.deploy(Banque);
	const BanqueContract = await Banque.deployed();

}