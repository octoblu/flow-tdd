_      = require 'lodash'
moment = require 'moment'

MergeExchangeMeetings = require('../src/merge-exchange-meetings')

xdescribe 'MergeExchangeMeetings', ->
  beforeEach ->
    @fixture = require './fixtures/with-exchange-meeting'
    exchangeMeetings = @fixture.genisys.exchange.meetings
    genisysMeetings = @fixture.genisys.meetings
    @data = MergeExchangeMeetings exchangeMeetings, genisysMeetings

  it 'should match up meetings with the same itemId', ->
    expect(@data['250eafc0-97f5-11e6-8a6f-9d0a4fd407f9'].exchange).to.exist

  it 'should match up meetings based on extendedProperties.genisysMeetingId', ->
    expect(@data['61c85096-d529-4c27-b477-03d6d62e1341'].exchange).to.exist

  it 'should create a meetingId for non-matches', ->
    meeting = _.find(@data, {exchange: itemId: 'YYMkADYxNGJmNGNmLTIxYTctNDlkOC1hZWRmLTJjMTMzZmI5YmUxNABGAAAAAAACtVr7DjkQQ4cFx7dwBexwBwD9KrxseohjTIFhVu2R9k27AAAAAAENAAD9KrxseohjTIFhVu2R9k27AAAS/0PXAAA='})
    expect(meeting).to.exist
