require 'sse'

class BrowserController < ApplicationController
  include ActionController::Live



  def foo
    # logger.debug "browser#index called"
    # logger.debug "id is: #{params[:id]}"
    # logger.debug('>>> set headers')
    response.headers['Content-Type'] = 'text/event-stream'

    # logger.debug('>>> create stream')
    #sse = Reloader::SSE.new(response.stream)
    sse = SSE.new(response.stream)

    begin
      loop do
        t = ticket
        logger.debug(">>> writing ticket: #{t}")
        sse.write t
        sleep 4
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      logger.debug('>>> closing connection')
      sse.close
    end
  end



  def ticket
    {:name => "Jerry #{rand(1..100)}"}
  end



end