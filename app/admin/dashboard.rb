ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
      # span class: "blank_slate" do
        # span I18n.t("active_admin.dashboard_welcome.welcome")
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    # end

  columns do
      column do
        panel "Últimos Pedidos" do
          table_for Pedido.order("created_at desc").limit(10).map do
            column("Email"){|order| order.mail                                    }
            column("Fecha de Compra"){|order| order.created_at                                   }
            column("Estado"){|order| order.status                           } 
            column("Importe"){|order| order.precio                               } 
          end
          end
        end
      
 
      column do
        panel "Productos ordenados por Stock" do
          table_for Producto.order("stock asc").limit(10).map do
            column("Nombre"){|order| order.nombre                                    }
            column("Estado"){|order| order.estado                                    }
            column("Tipo de Producto"){|order| order.tipoProducto                                    } 
            column("Stock"){|order| order.stock                                   } 
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
