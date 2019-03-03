class Link < ApplicationRecord
  belongs_to :subscriber,
    foreign_key: :subscriber_id,
    class_name: 'Resource'

  belongs_to :target,
    foreign_key: :target_id,
    class_name: 'Resource'
end
