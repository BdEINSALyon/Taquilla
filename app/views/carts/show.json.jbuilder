json.set! :id, @cart.to_sgid.to_s
json.status @cart.status
json.user @cart.user.to_sgid.to_s unless @cart.user.nil?
json.event do
  json.extract! @event, :id, :name, :description
  json.passes do
    json.array! @event.passes do |pass|
      json.set! :id, pass.to_sgid.to_s
      json.extract! pass, :name, :description, :price
    end
  end
end
json.tickets do
  json.array! @cart.tickets do |ticket|
    json.set! :id, ticket.to_sgid.to_s
    json.pass do
      json.set! :id, ticket.pass.to_sgid.to_s
      json.extract! ticket.pass, :name, :description, :price
    end
    json.status ticket.status
  end
end