class Notifications < ActionMailer::Base

  def assigned(asset, sent_at = Time.now)
    subject    'Asset Assigned'
    recipients asset.user.email
    # from       $EMAIL_FROM
    sent_on    sent_at
    body       :asset => asset
  end

  def unassigned(asset, sent_at = Time.now)
    subject    'Asset Unassigned'
    recipients asset.user.email
    # from       $EMAIL_FROM
    sent_on    sent_at  
    body       :asset => asset
  end

end
