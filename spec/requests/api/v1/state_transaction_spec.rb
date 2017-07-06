
require 'rails_helper'

describe "StateTransaction API" do

	it 'state transaction list' do
    5.times do |i|
    	StateTransaction.create!({
    		street: "A-#{i}", city: "Ahmedabad",
	    	zip: "380015", state: "Gujarat",
	    	beds: 2, baths: 1,
	    	sq_feet: rand(999), prop_type: 'Residential',
	    	sale_date: 'Wed May 21 00:00:00 EDT 2017',
	    	price: 12000, latitude: 23.0199968,	longitude: 72.2995501
    	})
    end 
    
    get "/api/v1/state_transactions"
    expect(JSON.parse(response.body).length).to eq(5)
  end


  it 'state transaction list pagination' do
    8.times do |i|
    	StateTransaction.create!({
    		street: "A-#{i}", city: "Ahmedabad",
	    	zip: "380015", state: "Gujarat",
	    	beds: 2, baths: 1,
	    	sq_feet: rand(999), prop_type: 'Residential',
	    	sale_date: 'Wed May 21 00:00:00 EDT 2017',
	    	price: 12000, latitude: 23.0199968,	longitude: 72.2995501
    	})
    end 
    
    get "/api/v1/state_transactions", params: { per_page: 2 }
    expect(JSON.parse(response.body).count).to eq(2)
  end


  it 'state transaction list filter' do
    20.times do |i|
    	StateTransaction.create!({
    		street: "A-#{i}", city: "Ahmedabad",
	    	zip: "380015", state: "Gujarat",
	    	beds: 2, baths: 1,
	    	sq_feet: rand(i*100), 
	    	prop_type: [0,1,2,3].sample,
	    	sale_date: 'Wed May 21 00:00:00 EDT 2017',
	    	price: 12000, latitude: 23.0199968,	longitude: 72.2995501
    	})
    end 
    
    get "/api/v1/state_transactions", params: { type: 2 }
    expect(JSON.parse(response.body).count).to be >= 1 
  end

	it 'create state transaction' do
		data = {
		    		street: "A-71", city: "Ahmedabad",
			    	zip: "380015", state: "Gujarat",
			    	beds: 2, baths: 1,
			    	sq_feet: rand(100), 
			    	prop_type: 'Condo' ,
			    	sale_date: 'Wed May 21 00:00:00 EDT 2017',
			    	price: 12000, latitude: 23.0199968,	longitude: 72.2995501
		    	}
    
    post "/api/v1/state_transactions", params: { state_transaction: data }
    expect(JSON.parse(response.body)['street']).to eq(data[:street]) 
  end

  it 'update state transaction' do
		data = StateTransaction.create!(
		    		street: "A-71", city: "Ahmedabad",
			    	zip: "380015", state: "Gujarat",
			    	beds: 2, baths: 1,
			    	sq_feet: rand(100), 
			    	prop_type: 'Condo' ,
			    	sale_date: 'Wed May 21 00:00:00 EDT 2017',
			    	price: 12000, latitude: 23.0199968,	longitude: 72.2995501
		    	)
    
    patch "/api/v1/state_transactions/#{data.id}", params: { state_transaction: {street: 'A-72'} }
    expect(JSON.parse(response.body)['street']).to eq('A-72') 
  end

  it 'update state transaction' do
		data = StateTransaction.create!(
		    		street: "A-71", city: "Ahmedabad",
			    	zip: "380015", state: "Gujarat",
			    	beds: 2, baths: 1,
			    	sq_feet: rand(100), 
			    	prop_type: 'Condo' ,
			    	sale_date: 'Wed May 21 00:00:00 EDT 2017',
			    	price: 12000, latitude: 23.0199968,	longitude: 72.2995501
		    	)
    
    delete "/api/v1/state_transactions/#{data.id}"
    expect(response).to have_http_status(204) 
  end


end