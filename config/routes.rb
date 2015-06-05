Rails.application.routes.draw do
  root to: redirect("/admin/categories")

  scope :admin, module: :admin, as: :admin do
    resources :categories, only: :index do
      resources :sub_categories, only: :index do
        resources :forms, except: :show do
          resources :fields, except: :show do
            resources :options, except: :show
          end
        end
      end
    end
  end
end
