#improved update_attributes that returns changes along with attributes changed

module ActiveRecord
  class Base
    def update_attributes_changed(attributes)
      self.attributes = attributes
      changes = self.changes
      return save, changes
    end
  end
end
