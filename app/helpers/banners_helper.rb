module BannersHelper
  def load_banner(placement_identifier)
    bp = BannerPlacement.find_by_identifier(placement_identifier)
    banners = bp.banners.active.all
  end
end
