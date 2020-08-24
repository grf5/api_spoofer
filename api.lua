-- Run only if POST method used
if ngx.req.get_method() == "POST" then
  -- Read the body being passed
  ngx.req.read_body() 
  -- Load the JSON parser
  local cjson = require "cjson"
  -- Parse the body as JSON
  local body_json = ngx.req.get_body_data() ==
    -- This is a statement setting it to an empty object if it doesn't exist
    nil and {} or cjson.decode(ngx.req.get_body_data())
  -- Seed the randomizer from the time
  math.randomseed( os.time() )
  -- Create a random request ID
  local request_identifier = math.random(10000,99999)
  -- Create a random value
  local score = math.random(1,100)
  -- Generate the response
  ngx.say(cjson.encode({requestId=request_identifier,status="200",statusMessage="Success",responseObj={user=body_json["username"],result="Logged in!"}}))
end
