module Fullslate

  # {
  #   "id": "y1wr91PTGa",
  #   "employee": {
  #     "id": 4,
  #     "name": "Marci Blackman"
  #   },
  #   "type": "appointment",
  #   "at": "2016-01-25T11:00:00-0500",
  #   "to": "2016-01-25T12:00:00-0500",
  #   "global_id": "ORH0wOlS5q7G9V2G6QPjiVuByl@fullslate.com",
  #   "global_sequence": 1,
  #   "services": [
  #     {
  #       "id": 1766,
  #       "name": "Tax Prep 1-CF-ICM3"
  #     }
  #   ],
  #   "deleted": true
  # }

  class Booking
    API_PATH = '/bookings'
    attr_reader :id, :employee_name, :at, :to, :deleted, :service_id

    def initialize(params)
      @id = params["id"]
      @employee_name = params["employee"]["name"]
      @at = params["at"]
      @to = params["to"]
      @deleted = params["deleted"]
      @service_id = params["services"].first["id"]

      if @id.nil?
        raise Fullslate::BookingNotFound
      end
    end
  end

end
