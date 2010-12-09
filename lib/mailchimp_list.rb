class MailchimpList
  
  def self.add_subscriber(email, first_name, last_name)
    use_mailchimp = Setting.get('integrations.use_mailchimp')
    if use_mailchimp
      api_key = Setting.get('integrations.mailchimp_api_key')
      list_id = Setting.get('integrations.mailchimp_unique_id')
      gb = Gibbon::API.new(api_key)
      puts gb.list_subscribe({:apikey=>api_key, :id=>list_id, :email_address=>email, :merge_vars=>{'FNAME'=>first_name, 'LNAME'=>last_name}, 
                              :double_optin=>false})
      
    end
  end
end