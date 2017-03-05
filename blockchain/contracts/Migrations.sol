pragma slidity ^0.4.0;

contract Migrations {
	address public owner;
	uint public last_completed_migration;

	modifier restricted() {
		if(msg.sender == owner) _;
	}

	function Migrations() {
		owner = msg.sender;
	}
	
	function setCompleted(uint completed) restricted {
		last_complete_migtation = completed;
	}

	function upgarde(address new_adderss) restricted {
		Migration upgraded = Migrations(new_address);
		upgaraded.setCompleted(last_completed_migration);
	}
}
