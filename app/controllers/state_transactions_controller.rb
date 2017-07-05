class StateTransactionsController < ApplicationController

  def index
  end

  def import
    CsvImportWorker.perform_async(params[:file].path)
    redirect_to root_path, notice: "File is imported successfully."
  end

end
