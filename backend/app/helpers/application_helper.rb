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