//var x = document.getElementById("demo");
//var y = 0;
//var z = 0;
//function getLocation() {
//    if (navigator.geolocation) {
//        navigator.geolocation.getCurrentPosition(showPosition);
//    } else {
//        x.innerHTML = "Geolocation is not supported by this browser.";
//    }
//}

//function showPosition(position) {
//    //x.innerHTML = "Latitude: " + position.coords.latitude +
//    //    "<br>Longitude: " + position.coords.longitude;
//    //alert(position.coords.latitude);
//    y = position.coords.latitude;
//    z = position.coords.longitude;
//    document.getElementById('txt1').value = y;
//    document.getElementById('txt2').value = z;

//}
$(document).ready(function () {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(weather);
	} else {
		alert("Geolocation isn't supported!");
	}
});

function weather(position) {
	var lat = position.coords.latitude;
	var lon = position.coords.longitude;
	var apiKey = "13d492da3b2ecaeb186f71c0c80ff9ec";
	url =
		"https://api.darksky.net/forecast/" +
		apiKey +
		"/" +
		lat +
		"," +
		lon +
		"?exclude=alerts,hourly,alerts,flags";
	//Call DarkSky and pull current weather
	$.ajax({
		url: url,
		dataType: "jsonp",
		success: function (forecast) {

			var fTemp = forecast.currently.temperature;

			var currentTemp = fTemp;
			var cTemp = Math.floor((fTemp - 32) * 5 / 9);

			$("#temp").html('<h2 style = "float: right">' + currentTemp + "</h2>");
			$("#far").addClass("active");
			celConvert(cTemp, currentTemp, fTemp);
			farConvert(cTemp, currentTemp, fTemp);

			//Skycons
			var iconRequest = forecast.currently.icon;

			var icons = new Skycons({ 'color': '#eeeeee' });

			var iconList = [
				"clear-day",
				"clear-night",
				"partly-cloudy-day",
				"partly-cloudy-night",
				"cloudy",
				"rain",
				"sleet",
				"snow",
				"wind",
				"fog"
			];
			console.log(icons);
			for (i = 0; i < iconList.length; i++) {
				if (iconRequest == iconList[i]) {
					icons.set('icon', iconList[i]);

				}
			}
			icons.play();
		}
	});
	GoogleMaps(lat, lon);
}

function GoogleMaps(latitude, longitude) {
	$.get(
		"https://maps.googleapis.com/maps/api/geocode/json?latlng=" +
		latitude +
		"," +
		longitude +
		"&key=AIzaSyAW0tnVQ4-ezK2M9Lq-CDhFWJFn8-JuyCQ&result_type=locality|administrative_area_level_1",
		function (json) {
			var address_comp = json.results[0].address_components;
			var city = "";
			var state = "";

			address_comp.forEach(function (loc) {
				var type = loc.types;
				if (type.indexOf("locality") != -1) {
					city = loc.long_name;
				} else if (type.indexOf("administrative_area_level_1") != -1) {
					state = loc.short_name;
				}
			});
			address = city + ", " + state;
			$("#address").html('<h3 class = "text-center">' + address + "</h3>");
		}
	);
}

function celConvert(cTemp, currentTemp, fTemp) {
	$("#cel").click(function () {
		currentTemp = cTemp;
		$("#temp").html('<h2 style = "float: right">' + currentTemp + "</h2>");
		$("#far").removeClass("active");
		$("#cel").addClass("active");
		$("#txt2").text(currentTemp);
		$("#txt1").text("");
	});
}

function farConvert(cTemp, currentTemp, fTemp) {
	$("#far").click(function () {
		currentTemp = fTemp;
		
		$("#temp").html('<h2 style = "float: right">' + currentTemp + "</h2>");
		$("#cel").removeClass("active");
		$("#far").addClass("active");
		$("#txt1").text(currentTemp);
		$("#txt2").text("");
	});
}