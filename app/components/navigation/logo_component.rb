# frozen_string_literal: true

class Navigation::LogoComponent < ApplicationComponent
  erb_template <<-ERB
      <%= link_to root_path, class: 'inline-block my-3' do %>
        <%= image_tag asset_path('logo-frogogo.png'), alt: 'Frogogo' %>
      <% end %>
  ERB

end
