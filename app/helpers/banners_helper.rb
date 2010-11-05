module BannersHelper
  def load_banner(placement_identifier)
    bp = BannerPlacement.find_by_identifier(placement_identifier)
    banners = bp.banners.active.all
    banner = banners.sort_by{ rand }.first
    content_tag(:div, link_to(image_tag(banner.banner.url(:target)), banner.target_url), :id=>"banner_#{banner.id}", :class=>"banner_wrapper")
  end
end
