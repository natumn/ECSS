const redis = require("redis").createClient();
const bcrypt = require("bcrypt");

function User(obj) {
	for (var key in obj) {
		this[key] = obj[key];
	}
}

User.prototype.save = function(fn) {
	if(this.id) {
		this.update(fn);
	} else {
		const user = this;
		redis.incr("user:ids",function(err,id) {
			if(err) return fn(err);
			user.id = id;
			user.hashPassword(function(err) {
				if(err) return fn(err);
					user.update(fn);
			});
		});
	}
};

User.prototype.update = function(fn) {
	var user = this;
	var id = user.id;

	redis.set("user:id:" + user.name, id, function(err){
		if(err) return fn(err);
		redis.hmset("user:" + id,user, function(err){
			fn(err);
		});
	});
};

User.prototype.hashPassword = function(fn) {
	var user = this;
	bcrypt.genSalt(12 ,function(err, salt) {
		if(err) return fn(err);
		user.salt = salt;
		bcrypt.hash(user.pass, salt, function(err, hash){
			if(err) return fn(err);
			user.pass = hash;
			fn();
		});
	});
};

User.getByName = function(name, fn) {
	User.getId(name, function(err, id) {
		if (err) return fn(err);
		User.get(id ,fn);
	});
};

User.getId = function(name, fn) {
	redis.get("user:id:" + name, fn);
};

User.get = function(id, fn) {
	redis.hgetall("user: " + id,function(err, user) {
		if(err) return fn(err);
		fn(null, new User(user));
	});
};

User.authenticate = function(name,pass, fn) {
	User.getByName(name, function(err, user) {
		if (err) return fn(err);
		if(!user.id) return fn();
		bcrypt.hash(pass,user.salt, function(err, hash) {
			if(err) return fn(err);
			if(hash == user.pass) return fn (null, user);
			fn();
		});
	});
};

module.exports = User;
