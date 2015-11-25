require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @cookies = {}
    if req.cookies.has_key?("_rails_lite_app")
      @cookies = JSON.parse(req.cookies["_rails_lite_app"])
    end
  end

  def [](key)
    @cookies[key]
  end

  def []=(key, val)
    @cookies[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    json_cookies = @cookies.to_json
    res.set_cookie("_rails_lite_app", {path: "/", value: json_cookies})
  end
end
