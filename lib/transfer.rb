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
    if @sender.balance < @amount
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit(@amount * -1) 
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if self.valid? && self.status == "complete" && @sender.balance > @amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
     end
  end
end
