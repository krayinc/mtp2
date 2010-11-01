String.prototype.toHalfWidthNum = function() {
  return this.replace(/[０-９]/g, function(str) {
    return String.fromCharCode(str.charCodeAt(0) - 65248);
  });
}

Number.prototype.humanizedDuration = function() {
  var duration = this;
  var seconds = duration % 60;
  duration -= seconds;
  if (duration == 0) { return '1 分'; }
  duration /= 60;

  var minutes = duration % 60;
  duration -= minutes;
  if (duration == 0) { return minutes + ' 分'; }
  duration /= 60;

  var hours = duration % 24;
  duration -= hours;
  if (duration == 0) {
    var result = hours + ' 時間';
    if (minutes > 0) { result += ' ' + minutes + ' 分'; }
    return result;
  }
  duration /= 24;

  var result = duration + ' 日';
  if (hours   > 0) { result += ' ' + hours   + ' 時間'; }
  if (minutes > 0) { result += ' ' + minutes + ' 分'; }
  return result;
}
