_      = require 'lodash'
moment = require 'moment'

RemoveDeletedExchangeMeetings = require('../src/remove-deleted-exchange-meetings')

describe 'RemoveDeletedExchangeMeetings', ->
  beforeEach ->
    @fixture = require './fixtures/without-exchange-meeting'
    exchangeMeetings = @fixture.genisys.exchange?.meetings
    genisysMeetings = @fixture.genisys.meetings
    @data = RemoveDeletedExchangeMeetings exchangeMeetings, genisysMeetings

  it 'should match up meetings based on itemId', ->
    expect(@data['250eafc0-97f5-11e6-8a6f-9d0a4fd407f9']).to.exist
