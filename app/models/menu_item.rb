class MenuItem < ActiveRecord::Base
  belongs_to :business
  default_scope -> { order('created_at DESC') }
  validates :name, presence: true, length: { maximum: 140 }
  validates :business_id, presence: true
  validates :price, presence: true,
            numericality: true,
            format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }


    has_attached_file :photo #only thing truly needed. below is for production env.
    :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => ENV['wolberine'],
                                          :access_key_id     => ENV['AKIAJZZ6NPB63BRFJPGQ'],
                                          :secret_access_key => ENV['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']},
                      :s3_protocol    => "https"                                             ,
                      :s3_host_name   => "s3.amazonaws.com"
  
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  #
end


