require 'json'

class Flash
  def initialize(req)
    @flash_cookies = {}
    if req.cookies.has_key?("_flash")
      c = req.cookies["_flash"].map { |key, val| {key.to_s => val} }.flatten

      @flash_cookies = JSON.parse(req.cookies["_flash"])
    end
  end

  def [](key)
    @flash_cookies[key.to_s]
  end

  def []=(key, val)
    @flash_cookies[key.to_s] = [val, 1]
  end

  def now

  end

  def store_flash_cookies(res)
    @flash_cookies.map { |key, val| [key.to_s, val] }
    json_flash_cookies = @flash_cookies.to_json
    res.set_cookie("_flash", {path: "/", value: json_flash_cookies})
  end
end
