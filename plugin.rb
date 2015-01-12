# name: discourse-vietnamese-slug
# about: A Discourse plugin to support Vietnamese slug
# version: 1.0
# authors: Khoa Nguyen
# encoding: utf-8


module Slug

  def self.for(string)
  
	#For Vietnamese slug 
    vietnamese   = "àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐêùà"
    replacements = "aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyydAAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYDeua"
	string = string.tr(vietnamese, replacements)
	#End Vietnamese slug
	
    slug = string.gsub("'", "").parameterize
    slug.gsub!("_", "-")
    # TODO review if ja should use this
    # ko asked for it to be removed
    if ['zh_CN', 'ja'].include?(SiteSetting.default_locale)
      unless defined? Stringex
        require 'stringex_lite'
      end
      slug = string.to_url
    end
    slug =~ /[^\d]/ ? slug : '' # Reject slugs that only contain numbers, because they would be indistinguishable from id's.
  end

end
