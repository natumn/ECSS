var domain = (process.env.NODE_ENV === 'production')?'10.0.82.198':'localhost';
var mongoose = require('mongoose');
var url = 'mongodb://' + domain + '/user';
var db  = mongoose.createConnection(url, function(err, res){
    if(err){
        console.log('Error connected: ' + url + ' - ' + err);
    }
    else{
        console.log('Success connected: ' + url);
    }
});
// AuthのModelの定義
var AuthSchema = new mongoose.Schema({
    hospitalId: String,
    passWord: String
});

module.exports = mongoose.model('Auth', AuthSchema);
