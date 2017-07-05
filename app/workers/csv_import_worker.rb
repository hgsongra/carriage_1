class CsvImportWorker
  include Sidekiq::Worker

  def perform(file_path)
    StateTransaction.import(file_path)
  end
end
