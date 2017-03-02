const Model = require("../models/model");
const Auth = require("../models/auth");
const bcrypt = require("bcrypt");
const express = require("express");
const auth = require("../lib/user");
const xss = require("xss");

const router = express.Router();

router.route("/login")
	.post(function(req,res) {
		const hospitalId = xss(req.body.hospitalId);	
		const passWord = xss(req.body.passWord);

		Model.authLogin(hospitalId, passWord)
			.then()
			.catch(
				res.status(500).json({
					error: err.String()
				});
			);

		
	});

router.route("/chart")
	.post(function(req,res) {
		const chart.patientId = req.body.patientId;
		const chart.patientName = req.body.patientName;
		const chart.chartData = req.body.chartData;
		
		function saveToMongoDB(patientId ,patientName ) {
			return new Promise( (resolve, reject) => {
				chart.save( (err, patient) => {
					resolve(chart);
					reject(err);
				})
			})
		}
		
		saveToMongoDB().then(function SaveToBlockChainDB() {
			//chartのデータをBlockChainDBに保存する。
			
		});
		res.json(chart);
	});

router.route("/chart/:patientId")
	.get(function(req,res) {
		const chart.patientId = req.params.patientId;
		const chart.patientName = req.body.patientName;
		//chartのデータをもとにBlockChainDBからデータを取得する。
		
		res.json(chart);
	});

module.exports = router;
