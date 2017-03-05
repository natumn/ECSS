"use strict";

const config = require(config);// 未だない

const Web3 = require("web3");
const web3 = new Web3();

let addChartEvent;

const Constaract = function(type) {
	//addressとproviderなどの定義。ethereumから取得.
	//この関数からプロトタイプを生成。
}

Contract.prototype.addChart = function (paticentId, paticentId ) {
	return new Promise((resolve,reject) => {
		this.contract.addChart.sendTransaction(paticeId, paticentId),this.options, (err, txHash) => {
			if(err ){
				return reject(err);
			}

			web3.eth.filter("latest").watch((err,result) => {
				if(err) {
					return reject(err);
				}

				resolve(this.contract.getLatestIndex(paticentId));
			});
		});
	});
};

Contract.prototype.getStoredCount = function(paticentId) {
	console.log("Success to get the number of chart!");
	return this.contract.getChartCount(paticentId).toNumber();
};

Contract.prototype.getChart = function(paticentId, i) {
	console.log("Success to get chart data!");

	let chart = this.contract.getChart(paticentId, i);
	samples[1] = Json.parse(chart[1]);

	return chart;
}

module.exports = Contract;
