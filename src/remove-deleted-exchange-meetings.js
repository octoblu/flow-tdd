var _      = require('lodash');
var moment = require('moment');
var UUID   = require('uuid');

var RemoveDeletedExchangeMeetings = function(exchangeMeetings, genisysMeetings, endTime){
  var results = {};

  _.each(genisysMeetings, function(genisysMeeting) {
    if (!genisysMeeting.exchange) return;
    var itemId = genisysMeeting.exchange.itemId;
    if (moment(genisysMeeting.endTime).utc().isBefore(endTime)) return;

    var exchangeMeeting = _.find(exchangeMeetings, { itemId: itemId });
    if (exchangeMeeting) return;
    results[genisysMeeting.meetingId] = genisysMeeting;
  });

  return results;
}

module.exports = RemoveDeletedExchangeMeetings;
