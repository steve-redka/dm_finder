module GamesHelper
    def cover_image_tag(record, variant: [300, 300], default: "placeholder.jpg", **options)
        if record.cover_image.attached?
          image_tag record.cover_image.variant(resize_to_limit: variant), **options
        else
          image_tag default, **options
        end
      end
end
