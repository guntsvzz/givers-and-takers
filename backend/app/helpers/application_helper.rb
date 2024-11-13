# In app/helpers/application_helper.rb or a specific helper file
module ApplicationHelper
    def display_organization_type(type)
      return "Not specified" if type.nil?
      
      case type
      when "non_profit"
        "Non-Profit Organization"
      when "educational"
        "Educational Institution"
      when "corporate"
        "Corporate Entity"
      when "government"
        "Government Agency"
      when "other"
        "Other Organization Type"
      else
        type.humanize
      end
    end
  end

  # app/helpers/application_helper.rb
  def get_status_image(status)
    case status
    when User::STATUSES[:verified]
      asset_path('verified.png')
    when User::STATUSES[:non_verified]
      asset_path('non-verified.png')
    else
      asset_path('default-status.png')
    end
  end


