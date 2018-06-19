class ExclusionArrayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?

    if value.kind_of? Array
      value.reject!(&:blank?) if options.key?(:deny_blank)

      if options.key?(:presence)
        record.errors.add(attribute, :empty) if value.empty?
      end

      record.errors.add(attribute, :blacklist) if value.include?(blacklist)
    end
  end

  private

  def blacklist
    options[:in].to_s
  end
end
