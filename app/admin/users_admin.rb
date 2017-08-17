Trestle.resource(:users) do
  menu do
    item :users, icon: "fa fa-user"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :avatar, -> (user) { image_tag(user.image_url_or_default, class: "avatar") }
    column :name
    column :posts, -> (user) {user.posts.count}
    column :comments, -> (user) {user.comments.count}
    column :likes, -> (user) {user.likes.count}
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |user|
    text_field :name
    text_field :email
    password_field :password
    text_field :image_url
    text_field :city
    text_field :state
    text_field :position
    text_field :school
    text_field :quote
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:user).require(:name, ...)
  # end
end
