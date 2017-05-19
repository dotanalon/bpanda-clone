/* load the fs module for access the images*/
const fs = require('fs');
const testFolder = __dirname + '/resources/';

var http = require('http');
var config = require('./config.json');
var HttpDispatcher = require('httpdispatcher');
var dispatcher = new HttpDispatcher();
var images = fs.readdirSync(testFolder);
var oldrand = 0;

function handleRequest(request, response){
    try {
        console.log("Requested URL: " + request.url);
        dispatcher.dispatch(request, response);
    } catch(err) {
        console.log(err);
    }
}

dispatcher.onGet("/", function(req, res) {
    var rand = Math.floor(Math.random() * images.length);
/*
   since I used little number of images the random range is very small,
   there for I need to make sure no duplication of rand returns that will couse duplication of results
*/
    if (rand == oldrand){
        if (rand == 0){
           rand++
        } else {
           rand--
      }
    }
    var img = fs.readFileSync(testFolder + images[rand]);
    res.writeHead(200, {'Content-Type': 'image/jpg'});
    res.end(img, 'binary');
    oldrand = rand;
});

dispatcher.onError(function(req, res) {
        res.writeHead(404);
        res.end("404 - Page Does not exists");
});

http.createServer(handleRequest).listen(config.port, function(){
    console.log("Server listening on: http://localhost:%s", config.port);
});

