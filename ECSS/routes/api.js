const express = require("express");

const router = express.Router();

router.route("/login")
	.post(function(req,res) {
		const login.hospitalID = req.body.hospitalID;	
		const login.passward = req.body.passward;

		
	});

router.route("/chart")
	.post(function(req,res) {
		const chart.patientId = req.body.patientId;
		const chart.patientName = req.body.patientName;
		const chart.chartData = req.body.chartData;
		
		function saveToMongoDB(patientId ,patientName ) {
			chart.save(function(err) {
				if(err) {
					return res.status(500).json({
						error: err.String()
					});
				}
			})
		}
		
	});

router.route("/chart/:patientId")
	.get(function(req,res) {
		const chart.patientId = req.params.patientId;
		const chart.patientName = req.body.patientName;
		
	});

