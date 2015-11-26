class Flash

  def initialize(req)
    if req.cookies.has_key?("_rails_lite_app")
      @cookies = JSON.parse(req.cookies["_rails_lite_app"])
    end
    flash = {}
    flash_now = {}
  end

  def store_flash(res)

  end

end
