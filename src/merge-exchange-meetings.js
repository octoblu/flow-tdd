var _      = require('lodash');
var moment = require('moment');
var UUID   = require('uuid');

var MergeExchangeMeetings = function(exchangeMeetings, genisysMeetings, endTime){
  var results = {};
  _.each(genisysMeetings, function(meeting){
    results[meeting.meetingId] = _.omit(meeting, ['exchange']);
  });

  _.each(exchangeMeetings, function(exchangeMeeting) {
    var itemId = exchangeMeeting.itemId;
    if (moment(exchangeMeeting.endTime).utc().isBefore(endTime)) return;

    var genisysMeeting;

    if (exchangeMeeting.extendedProperties) {
      genisysMeeting = results[exchangeMeeting.extendedProperties.genisysMeetingId]
    }
    if (!genisysMeeting) {
      genisysMeeting = _.find(genisysMeetings, { exchange: { itemId: itemId }});
    }
    if (genisysMeeting) {
      genisysMeeting.exchange = exchangeMeeting;
      results[genisysMeeting.meetingId] = genisysMeeting;
      return;
    }
    var newMeeting = {
      meetingId: UUID.v4(),
      exchange: exchangeMeeting
    }
    results[newMeeting.meetingId] = newMeeting;
  });

  return results;
}

module.exports = MergeExchangeMeetings;
