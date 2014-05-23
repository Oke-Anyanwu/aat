module Exceptions
  class LeaveStatusError < StandardError; end
  class LeaveNotTakenError < LeaveStatusError; end
end
