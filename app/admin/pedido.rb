ActiveAdmin.register Pedido do

actions :index, :show, :destroy
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :usuario, :mail, :precio, :notification_params, :status, :purchased_at

index do
  selectable_column
  column :nombre
  column :mail
  column :precio
  column :status
  column :cantidad
  actions
end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
