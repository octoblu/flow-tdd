var _      = require('lodash');
var moment = require('moment');

var FindEndedMeetings = function(genisysMeetings, endTime){
  var results = {}

  _.each(genisysMeetings, function(meeting) {
    if (meeting.ended === true) {
      results[meeting.meetingId] = meeting;
      return;
    }

    if (moment(meeting.endTime).utc().isBefore(endTime)) {
      results[meeting.meetingId] = meeting;
      return;
    }
  });

  return results;
}

module.exports = FindEndedMeetings;
