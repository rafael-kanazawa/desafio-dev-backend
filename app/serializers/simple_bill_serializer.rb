class SimpleBillSerializer < ActiveModel::Serializer
    attributes :id, :amount, :bill_status, :table_number, :table_id
end