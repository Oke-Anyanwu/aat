module PaperTrail
  class VersionDecorator < ApplicationDecorator
    def created_at
      object.created_at.strftime('%B %-d, %Y %l:%M%P %Z')
    end
  end
end
