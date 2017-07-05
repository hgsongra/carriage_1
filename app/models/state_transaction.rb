require 'csv'

class StateTransaction < ApplicationRecord

	enum prop_type: %w{Residential Condo Multi-Family Unkown}

	def self.import(file)
		if count == 0
			CSV.foreach(file, headers: true) do |row|
				create!(transaction_params(row))
			end
		else
			CSV.foreach(file, headers: true) do |row|
				state_transaction = where(street: row['street'], latitude: row['latitude'], longitude: row['longitude']).first
				if state_transaction.present?
					state_transaction.update(transaction_params(row))
				else
					create!(transaction_params(row))
				end
			end
		end
	end

	private
	
	def self.transaction_params(data)
		{
			street: data['street'],
			city: data['city'],
			zip: data['zip'],
			state: data['state'],
      beds: data['beds'],
      baths: data['baths'],
      sq_feet: data['sq__ft'],
      prop_type: data['type'],
      sale_date: data['sale_date'],
      price: data['price'],
      latitude: data['latitude'],
      longitude: data['longitude']
		}
	end
end
