module DiscourseApi
  module API
    module SSO
      def sync_sso(params={})
        sso = DiscourseApi::SingleSignOn.new
        sso.sso_secret = params[:sso_secret]
        sso.name = params[:name]
        sso.username = params[:username]
        sso.email = params[:email]
        sso.external_id = params[:external_id]
        sso.avatar_url = params[:avatar_url]
        post("/admin/users/sync_sso/", sso.payload)
      end
    end
  end
end
