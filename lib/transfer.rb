class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid? && @amount <= self.sender.balance
  end

  def execute_transaction
    @status = "complete"
  end
  
  def reverse_transfer
    
  end
  
end
