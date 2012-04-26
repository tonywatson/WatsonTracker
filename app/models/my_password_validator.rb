class MyPasswordValidator < ActiveModel::Validator
  def validate(record)
    vowels = record.password.scan(/[aeiou]/i)
    consonants = record.password.scan(/[^aeiou]/i)
    
    unless vowels.count == consonants.count
      record.errors[:password] << 'must have exactly as many vowels as consonants'
    end
  end
end