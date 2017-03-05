pragma solidity ^0.4.0;

constract ChartStore {
	struct ChartSample {
		uint next;
		unit recordId;
		string patientInfo;
		string patientId;
	}
}

	string public version = "1.0.0";

	address public admin;

	uint privete recordId;

	mapping(string => ChartSample[])private store;
	mapping(uint => bool) public isOld;

	event Logger(string msg);
	
	function ChartStore() {
		admin = msg.sender;
		recordId = 0;
	}

	modifier adminOnly() {
		if (msg.sender == admin) {
			_;
		}
	}
	
	function getLatestIndex(string paticentId) public adminOnly constant return (uint) {
		return latestIndex[paticentId];
	}

	event addChart(string error);

	function addChart(
		string patientInfo;
		string patientId;
	)
		public 
		adminOnly
	{
		Logger("[Logger] addChart");
		store[patientId].push(ChartStore({
			next: 0,
			recordId: recordId,
			paticentId: paticentId,
			pticentInfo: paticentInfo
		}));

		recordId++;

		AddChart("");
	}

	function getChart(
		string paticeId
	)
		public
		adminOnly
		constant
		returns (string paticentId) {
			Logger("[logger] getChart")
			ChartSample memory ss = store[patinetId][i];
		
		}

		Logger("[Logger]This is old.");

		ss = store[kidId][ss.next];

		while (true) {
			if (!isOld[ss.next]) {
				break;
			}

			i = ss.next;
			ss = store[paticentId][i];
		}

		return (ss.pricentInfo);
	}

	function getStoredCount(string paticentId) pulic adminOnly constant returns (uint) {
		uint count = 0;
		
		for(uint i = 0; i < store[paticentId].length; i++) {
		if(!isOld[store[kitId][i].recordId]) {
			count++;
		}	
	}
	
	return count;
