const mongoose = require("mongoose");

const Model = new Model();

Model.prototype.authLogin = function(hospitalId,passWord) {
	searchId(hospitalId)
		.then((pospitalId,passWord) => {
			Auth.findOne({"passWord":passWord}, function(err) {
				res.status(500).json({
					error: err.String()
				});
			})
		})
		.catch( err => {
			res.json(500).json({
				error: err.String()
			});
		});
	})
}

function searchId(hospitalId) {
	return new Promise(function(resolve,reject) {
		Auth.findOne({"hosptalId": hospitalId}, function(err,id) 
			resolve(id);
			reject(err);
		});
	});
}
