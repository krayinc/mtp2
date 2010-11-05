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
