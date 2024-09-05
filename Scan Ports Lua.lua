description = [[
Simple script to list open ports on the target host.
]]

-- Function to define port scanning rule
portrule = function(host, port)
  return port.state == "open"  -- Only process open ports
end

-- Main action function
action = function(host)
  local open_ports = {}

  -- Check if the ports are open
  for _, port in ipairs(host.ports) do
    if port.state == "open" then
      table.insert(open_ports, port.number)
    end
  end

  if #open_ports > 0 then
    return string.format("Host: %s\nOpen ports: %s", host.ip, table.concat(open_ports, ", "))
  else
    return "No open ports found on the host."
  end
end
