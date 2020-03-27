class BreezeRequest < BaseModel
  table do
    column path : String
    column method : String
    column action : String
    column status : Int32
    column session : JSON::Any
    column headers : JSON::Any
  end
end
