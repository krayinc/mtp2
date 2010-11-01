// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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
