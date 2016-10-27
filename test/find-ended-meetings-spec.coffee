_      = require 'lodash'
moment = require 'moment'

FindEndedMeetings = require('../src/find-ended-meetings')

describe 'FindEndedMeetings', ->
  beforeEach ->
    @fixture = require './fixtures/with-ended-meeting'
    genisysMeetings = @fixture.genisys.meetings
    @data = FindEndedMeetings genisysMeetings, moment('2016-10-22T01:01:00Z').utc()

  it 'should find ended meetings', ->
    expect(@data['111011f4-fd4b-48c5-a0c9-ec52e9b7e845']).to.exist
    expect(@data['2bb3beb5-7bcb-e7b1-161c-67c6c129522a']).to.exist
