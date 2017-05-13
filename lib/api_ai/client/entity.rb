module ApiAi
  class Client
    module Entity
      class InvalidEntityInputError < StandardError; end

      def entities(options={})
        get('entities')
      end

      def create_entity(name, options={})
        # TODO: Validate name and entries
        entries = options.fetch(:entries) do
          raise InvalidEntityInputError, "entries missing"
        end

        entries.map! do |entry|
          {
            value: entry[:value],
            synonyms: entry[:synonyms]
          }
        end

        post("entities", {name: name, entries: entries})
      end

      def entity(id, options={})
        get("entities/#{id}")
      end
    end
  end
end
