module UsersHelper
    def avatar_image_tag(record, variant: [100, 100], default: "avatar_placeholder.png", **options)
        if record.avatar.attached?
          image_tag record.avatar.variant(resize_to_limit: variant), **options
        else
          image_tag default, **options
        end
      end
end
