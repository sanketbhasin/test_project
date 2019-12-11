class Bug < ActiveRecord::Base

mount_uploader :image_path, ImageUploader

	belongs_to :project
  belongs_to :creator ,class_name: "User", foreign_key: :created_by
  belongs_to :solver ,class_name: "User", foreign_key: :solved_by, optional: true

  validates_processing_of :image_path
  validate  :image_size_validation
  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :description, presence: true, length: { minimum: 3, maximum: 200 }
  validates :status, presence: true,inclusion: { in: %w(New Started Completed Resolved) }
  validates :type, presence: true,inclusion: { in: %w(Features Bug) }
  validates :deadline, presence: true
 
private
  def image_size_validation
    errors[:image_path] << "should be less than 5000KB" if image_path.size > 5.megabytes
  end
end