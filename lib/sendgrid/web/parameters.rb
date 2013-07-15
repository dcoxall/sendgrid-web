module Sendgrid::Web::Parameters

  refine Hash do

    # Cleanse a Hash to prepare it for use with the SendGrid Web API.
    # It converts objects that respond to #strftime into the
    # +YYYY-MM-DD+ format.
    #
    # @return [Hash] +self+ after modifying the stored data.
    # @note Fallback is to call #to_s which means numeric values aren't
    #   correctly comparable afterwards.
    def cleanse!
      self.each do |key, value|
        if value.respond_to?(:strftime)
          value = value.strftime("%Y-%m-%d")
        elsif value.is_a?(Hash)
          value.cleanse!
        else
          value = value.to_s
        end
        self[key] = value
      end
      self
    end

    # Cleanse a Hash to prepare it for use with the SendGrid Web API.
    # It converts objects that respond to #strftime into the
    # +YYYY-MM-DD+ format.
    #
    # @return [Hash] a new Hash with the modified values.
    # @note Fallback is to call #to_s which means numeric values aren't
    #   correctly comparable afterwards.
    # @see #cleanse!
    def cleanse
      dup.cleanse!
    end

  end

end
