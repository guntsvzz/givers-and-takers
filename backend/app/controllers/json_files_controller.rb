class JsonFilesController < ApplicationController
  def index
    @json_files = JsonFile.all
  end

  def upload
    if params[:file].present?
      uploaded_file = params[:file]
      file_path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)

      # Save the file
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end

      # Save metadata to the database
      JsonFile.create(name: uploaded_file.original_filename, file_path: file_path.to_s)

      redirect_to json_files_path, notice: 'File uploaded successfully.'
    else
      redirect_to json_files_path, alert: 'No file selected.'
    end
  end

  def show
    @json_file = JsonFile.find(params[:id])
    file_content = File.read(@json_file.file_path)
    @json_data = JSON.parse(file_content)
  rescue StandardError => e
    redirect_to json_files_path, alert: "Error reading file: #{e.message}"
  end
  # def show
  #   @json_file = JsonFile.find(params[:id])
  #   file_content = File.read(@json_file.file_path)
  #   @json_data = JSON.parse(file_content)
  
  #   # Validate JSON structure
  #   unless @json_data.is_a?(Array) && @json_data.all? { |item| item.is_a?(Hash) }
  #     redirect_to json_files_path, alert: 'Invalid JSON structure.'
  #   end
  # rescue JSON::ParserError
  #   redirect_to json_files_path, alert: 'Invalid JSON file.'
  # end  
end
