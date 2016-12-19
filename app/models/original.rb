class Original < ApplicationRecord
	belongs_to :assignment, optional: true
	belongs_to :group, optional: true

	mount_uploader :stuff, StuffUploader
end
