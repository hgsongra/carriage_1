class CsvImportWorker
  include Sidekiq::Worker

  def perform(file_path)
    StateTransaction.import(file_path)
    # TODO: On file upload come task perform goes here. like: Email to user
  end
end
