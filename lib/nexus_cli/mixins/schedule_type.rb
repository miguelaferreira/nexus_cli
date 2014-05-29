module NexusCli

  class ScheduleType

    attr_accessor :id
    attr_accessor :fields

    def initialize(id, fields)
      @id = id
      @fields = fields
    end

    def to_s
      string = "Schedule Type #{@id} has #{@fields.length} field(s)\n"
      @fields.each do |field|
        string += "- #{field.to_s}\n"
      end
      string + "\n"
    end

    def self.read_json(parsed_json)
      schedule_type_id = parsed_json['id']
      fields = []
      form_fields_key = 'formFields'
      if parsed_json.has_key?(form_fields_key)
        form_fields_element = parsed_json[form_fields_key]
        get_form_field_values(form_fields_element).each do |data|
          fields << read_fields(data)
        end
      end
      ScheduleType.new(schedule_type_id, fields)
    end

    def self.read_fields(data)
      if data.kind_of?(Array)
        data.each do |element|
          Field.read_json(element)
        end
      else
        Field.read_json(data)
      end
    end

    def self.get_form_field_values(form_fields_element)
      if form_fields_element.kind_of?(Hash)
        values = form_fields_element['form-field']
      else
        values = form_fields_element
      end
      values
    end
  end

  class Field

    attr_accessor :label
    attr_accessor :is_required
    attr_accessor :type

    def initialize(label, is_required, type)
      @label = label
      @is_required = is_required
      @type = type
    end

    def to_s
      "Field #{@label} of type #{@type} is " + ('not ' unless @is_required) + 'required'
    end

    def self.read_json(parsed_json)
      label = parsed_json['label']
      is_required = parsed_json['required'] == 'true'
      type = parsed_json['type']
      Field.new(label, is_required, type)
    end

  end

end