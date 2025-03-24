class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def reset_db
    ActiveRecord::Base.connection.tables.each do |table|
      next if table.start_with?("solid_queue_") || table == "schema_migrations" || table == "ar_internal_metadata"
      ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE")
      ActiveRecord::Base.connection.reset_pk_sequence!(table)
  end
    system("bin/rails db:seed RAILS_ENV=#{Rails.env}")

    redirect_to root_path
  end
end
