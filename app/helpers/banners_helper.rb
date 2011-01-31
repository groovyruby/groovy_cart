module BannersHelper
  def load_banner(placement_identifier)
    bp = BannerPlacement.find_by_identifier(placement_identifier)
    unless bp.blank?
      banners = bp.banners.active.all
      unless banners.empty?
        banner = banners.sort_by{ rand }.first
        content_tag(:div, link_to(image_tag(banner.banner.url(:target)), banner_url(banner)), :id=>"banner_#{banner.id}", :class=>"banner_wrapper")
      end
    end
  end
end
