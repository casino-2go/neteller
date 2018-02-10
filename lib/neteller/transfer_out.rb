module Neteller
  class TransferOut
    attr_accessor :transaction_merchant_ref_id
    def initialize(options)
      options.each { |name, value| instance_variable_set("@#{name}", value) } unless options.nil?
    end

    def to_h
      result = {
        payeeProfile: {
        },
        transaction: {
          amount: @transaction_amount,
          currency: @transaction_currency,
          merchantRefId: @transaction_merchant_ref_id,
        },
        message: @message
      }
      result[:email] = @payee_profile_email if @payee_profile_email
      result[:accountId] = @payee_profile_account_id if @payee_profile_account_id
      result
    end
  end
end
