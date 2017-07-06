class Api::V1::StateTransactionsController < Api::V1::BaseController

	before_action :set_state_transaction, only: [:update, :destroy]

	def index
		json_response(StateTransaction.filter(params))
	end

	def create
		state_transaction = StateTransaction.create!(transaction_param)
		json_response(state_transaction, :created)
	end

	def update
		@state_transaction.update(transaction_param)		
		json_response(@state_transaction, :ok)
	end

	def destroy
		@state_transaction.destroy!
		head :no_content
	end

	private

	def set_state_transaction
		@state_transaction = StateTransaction.find(params[:id])
	end

	def transaction_param 
		params.require(:state_transaction).permit(:street, :city, :zip, :state, :beds, :baths, :sq_feet, :prop_type, :sale_date, :price, :latitude, :longitude)
	end
end
