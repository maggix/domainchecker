class UrlValidator < ActiveModel::EachValidator

  def validate(record)
    valid = begin
      URI.parse(record.host).kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      false
    end
    unless valid
      record.errors[attribute] << (options[:message] || "is an invalid URL")
    end
  end

end