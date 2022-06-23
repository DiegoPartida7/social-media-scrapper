ActiveAdmin.register Account do

  
  # == Menu =================================================================

  # == Includes =============================================================

  # == Scopes ===============================================================
  scope :all
  # scope "activo", :active
  # scope :pending_payment

  # == Permit Params ========================================================
  permit_params :name, :handler, :active, :user_id

  # == Filters ==============================================================
  filter :name
  filter :handler
  filter :active

  # == Extensions ===========================================================

  # == Index ================================================================
  index do
    selectable_column
    # id_column
    column :name do |account|
      auto_link(account, account.name)
    end
    # column :name
    column :handler
    toggle_bool_column :active
    actions
  end

  # # == Show =================================================================
  # sidebar 'Factura', only: :show do
  #   attributes_table_for charge do
  #     row 'Factura:' do |charge|
  #       link_to 'Ver factura', admin_document_path(charge.invoice_id) unless charge.invoice_id.blank?
  #     end
  #     row 'Facturar Publico General' do |charge|
  #       charge.generic_mx_invoice?
  #     end
  #   end
  # end

  # action_item :invoice_it, only: :show do
  #   link_to 'Facturar', { action: :generate_invoice, controller: :charges }, method: :post, data: { disable_with: 'Procesando...' } if (charge.invoice_id.blank? && charge.payed? && charge.amount_cents > 0)
  # end

  # == Form =================================================================
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Detalles' do
      f.input :name, label: "Nombre"
      f.input :handler
      f.input :user_id, input_html: { value: current_user.id }, as: :hidden
      f.input :active, input_html: { value: true }, as: :hidden
    end
    f.actions
  end

  # == Controller ===========================================================
  
end
