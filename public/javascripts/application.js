// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//mouseover
function smartRollover() {
  if(document.getElementsByTagName) {
    var images = document.getElementsByTagName("img");

    for(var i=0; i < images.length; i++) {
      if(images[i].getAttribute("src").match("_off."))
      {
        images[i].onmouseover = function() {
          this.setAttribute("src", this.getAttribute("src").replace("_off.", "_on."));
        }
        images[i].onmouseout = function() {
          this.setAttribute("src", this.getAttribute("src").replace("_on.", "_off."));
        }
      }
    }
  }
}

if(window.addEventListener) {
  window.addEventListener("load", smartRollover, false);
} else if(window.attachEvent) {
  window.attachEvent("onload", smartRollover);
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;if(!d) d=document;
  if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
  }
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
  if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

var mtp = {};
mtp.maps = {};

mtp.loadMapWithRoutes = function(elemId) {
  var destinations = $('#destinations [data-mtp-spot]');
  if (destinations.length < 2) {
    return false;
  }
  var spots = new Array();
  $(destinations).each(function(index, destination) {
    var $destination = $(destination);
    spots.push({
      id:        $destination.attr('data-mtp-spot'),
      latitude:  $destination.attr('data-mtp-spot-latitude'),
      longitude: $destination.attr('data-mtp-spot-longitude'),
      name:      $("#destinations [data-mtp-spot='" + $destination.attr('data-mtp-spot') + "'] .spotName").html()
    });
  });
  var router = new mtp.Router();
  var map = new google.maps.Map($('#' + elemId)[0], {
    zoom: 14,
    center: new google.maps.LatLng(spots[0].latitude, spots[0].longitude),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  router.query(map, spots);
}

mtp.Geocoder = function() {
  this.geocoder = new google.maps.Geocoder();
}

mtp.Geocoder.prototype = {
  addressToCoordinate: function(address, callback) {
    this.query({address: address, bounds: this.map.getBounds(), region: 'jp'}, callback);
  },

  coordinateToAddress: function(latLng, callback) {
    this.query({latLng: latLng}, callback);
  },

  query: function(opts, callback) {
    this.geocoder.geocode(opts, callback);
  },

  addressFilter: function(addresses) {
    var result = '';
    var addressComponents = addresses.filter(function(address){
      return jQuery.inArray('postal_code', address.types) == -1;
    });
    if (!addressComponents) { return addresses[0].long_name; }
    addressComponents = addressComponents.sort(function(a, b) {
      if (a.address_components.length > b.address_components.length) {
        return -1;
      } else if (a.address_components.length < b.address_components.length) {
        return 1;
      } else {
        return 0;
      }
    })[0].address_components.reverse();
    var i;
    var numberRegexp = /^\d+$/;
    var streetRegexp = /^\d+丁目$/;
    for (i = 0; i < addressComponents.length; i++) {
      if (jQuery.inArray('country', addressComponents[i].types) == -1) {
        var addressComponent = addressComponents[i].long_name.toHalfWidthNum();
        if (addressComponent.match(streetRegexp)) { addressComponent = addressComponent.replace('丁目', ''); }
        result += addressComponent;
        if (addressComponents[i + 1] && addressComponents[i + 1].long_name.toHalfWidthNum().match(numberRegexp)) { result += '-'; }
      }
    }
    return result;
  }
}

mtp.Router = function() {};

mtp.Router.prototype = {
  query: function(map, spots) {
    this.map = map;
    this.map.steps = new Array();
    this.map.spots = spots;

    if (spots.length <= 1) {
      $.gritter.add({title: 'MTP', text: 'ルートを確認するには行き先を 2 ヶ所以上設定する必要があります'});
      return;
    }
    this.clearAll();
    var i;
    var ds = new google.maps.DirectionsService();
    var travelMode;
//    if ($('input[name="travel_mode"]:checked').val() == 'walk') {
      travelMode = google.maps.DirectionsTravelMode.WALKING;
//    } else {
//      travelMode = google.maps.DirectionsTravelMode.DRIVING;
//    }
    $.gritter.add({title: 'MTP', text: 'ルート取得中...'});
    this.completedCount = 0;
    var context;
    for (i = 0; i < spots.length - 1; i++) {
      context = {
        map: this.map,
        origin: spots[i],
        destination: spots[i + 1],
        currentRouter: this
      }
      ds.route({
        avoidHighways:            false,
        avoidTolls:               false,
        destination:              new google.maps.LatLng(spots[i + 1].latitude, spots[i + 1].longitude),
        optimizeWaypoints:        true,
        origin:                   new google.maps.LatLng(spots[i].latitude, spots[i].longitude),
        provideRouteAlternatives: true,
        region:                   'jp',
        travelMode:               travelMode,
        unitSystem:               google.maps.DirectionsUnitSystem.METRIC,
        waypoints:                []
      }, $.proxy(this.queryCallback, context));
    }
  },

  queryCallback: function(result, status) {
    this.currentRouter.completedCount++;
    switch (status) {
      case google.maps.DirectionsStatus.OK:
        this.currentRouter.draw(result, this);
        var duration = 0;
        jQuery.each(this.map.steps, function(index, step) {
          duration += step.duration;
        })
        $('#required_time').text(duration.humanizedDuration());
        break;
      case google.maps.DirectionsStatus.INVALID_REQUEST:
//        $.gritter.add('リクエストが無効です。');
//        break;
      case google.maps.DirectionsStatus.MAX_WAYPOINTS_EXCEEDED:
//        $.gritter.add('経由地が多すぎます。経由地は最大 8 ヶ所です。');
//        break;
      case google.maps.DirectionsStatus.NOT_FOUND:
//        $.gritter.add('出発地・目的地・経由地のいずれかが見つかりません。');
//        break;
      case google.maps.DirectionsStatus.OVER_QUERY_LIMIT:
//        $.gritter.add('短期間にリクエストの制限回数を超えました。');
//        break;
      case google.maps.DirectionsStatus.REQUEST_DENIED:
//        $.gritter.add('ルートサービスを使用できません。');
//        break;
      case google.maps.DirectionsStatus.ZERO_RESULTS:
//        $.gritter.add('出発地・目的地間のルートが見つかりません。');
//        break;
      case google.maps.DirectionsStatus.UNKNOWN_ERROR:
      default:
        $.gritter.add({title: 'MTP', text: 'ルートの一部、または全部が取得できませんでした'});
        break;
    }
    if (this.currentRouter.completedCount == this.map.spots.length - 2) {
      $.gritter.add({title: 'MTP', text: 'ルートの取得が完了しました。<br>ルートをクリックすると所要時間が表示されます。<br>（ルート・所要時間は徒歩によるものです）'})
    }
  },

  clearAll: function() {
    while (this.map.steps.length > 0) {
      var step = this.map.steps.pop();
      step.polyline.setMap(null);
    }
  },

  draw: function(routes, context) {
    var path = new Array();
    var duration = 0;
    jQuery.each(routes.routes[0].legs[0].steps, function(index, step) {
      duration += step.duration.value;
      jQuery.each(step.path, function(index, latlng) {
        path.push(latlng);
      })
    });
    var polyline = new google.maps.Polyline({
      clickable: true,
      geodesic: true,
      map: this.map,
      path: path,
      strokeColor: '#0000FF',
      strokeOpacity: 0.5,
      strokeWeight: 5
    });
    polyline.duration     = duration;
    polyline.startAddress = routes.routes[0].legs[0].start_address;
    polyline.endAddress   = routes.routes[0].legs[0].end_address;
    google.maps.event.addListener(polyline, 'mouseover', function(event) {
      this.setOptions({strokeColor: '#FF0000'});
    });
    google.maps.event.addListener(polyline, 'mouseout', function(event) {
      this.setOptions({strokeColor: '#0000FF'});
    });
    google.maps.event.addListener(polyline, 'click', function(event) {
      $.gritter.add({title: 'MTP', text: context.origin.name + 'から' + context.destination.name + 'まで。<br>所要時間' + this.duration.humanizedDuration()});
    });
    this.map.steps.push({
      polyline: polyline,
      duration: duration
    });
  }
}
