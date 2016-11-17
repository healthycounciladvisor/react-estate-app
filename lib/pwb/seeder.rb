module Pwb
  class Seeder

    class << self
      # Called by this rake task:
      # rake app:pwb:db:seed                                  1 ↵
      #
      def seed!

        I18n.locale = :en
        # tag is used to group content for an admin page
        # key is camelcase (js style) - used client side to identify each item in a group of content

        seed_example_carousel
        seed_example_content_cols

      end

      protected

      def seed_example_carousel
        carousel_seed_file = Pwb::Engine.root.join('db', 'yml_seeds', 'content', 'carousel.yml')
        carousel_yml = YAML.load_file(carousel_seed_file)
        carousel_yml.each do |content_col_yml|
          unless Pwb::Content.where(key: content_col_yml["key"]).count > 0
            Pwb::Content.create!(content_col_yml)
          end
        end
      end

      def seed_example_content_cols
        # content_cols_seed_file = Pwb::Engine.root.join('db', 'yml_seeds', 'content_columns.yml')
        # content_cols_yml = YAML.load_file(content_cols_seed_file)
        # content_cols_yml.each do |content_col_yml|
        #   unless Pwb::Content.where(key: content_col_yml["key"]).count > 0
        #     Pwb::Content.create!(content_col_yml)
        #   end
        # end

        unless Content.exists?(key: "cac1")
          Content.create!(
            [
              { key: 'cac1',
                sort_order: 1,
                tag: 'content-area-cols',
                raw_es:
                '<div class="col-md-4 single-service">
            <div class="bordered top-bordered">
            </div>
            <div class="fa fa-home icon-service">
            </div>
            <h4>Encuentra tu hogar</h4>
            <p>Explícanos exactamente lo que estás buscando, tus necesidades, estamos seguros de que encontraremos el hogar que necesitáis tú y tu familia.                </p>
        </div>',
                raw_en:
                '<div class="col-md-4 single-service">
            <div class="bordered top-bordered">
            </div>
            <div class="fa fa-home icon-service">
            </div>
            <h4>Find your home</h4>
            <p>Explain to us exactly what you are looking for and we will do our best to find that ideal property that meets your needs.</p>
        </div>
    ' },
              { key: 'cac2',
                sort_order: 2,
                tag: 'content-area-cols',
                raw_es:
                '<div class="col-md-4 single-service">
            <div class="bordered top-bordered">
            </div>
            <div class="fa fa-user icon-service">
            </div>
            <h4>Agentes Inmobiliarios</h4>
            <p>Somos agentes inmobiliarios profesionales. Te ayudamos con todos los trámites, y te ahorramos dinero con las transacciones. Vamos de la mano durante todo el proceso, te guiamos y asesoramos desde el primer momento hasta el último.                </p>
        </div>                                    ',
                raw_en:
                '<div class="col-md-4 single-service">
            <div class="bordered top-bordered">
            </div>
            <div class="fa fa-user icon-service">
            </div>
            <h4>Professional Estate Agents</h4>
            <p>We are professional estate agents.  We will help you with all the paperwork and save you money along the way.</p>
        </div>                                    
    ' },
              { key: 'cac3',
                sort_order: 3,
                tag: 'content-area-cols',
                raw_es:
                '<div class="col-md-4 single-service">
            <div class="bordered top-bordered">
            </div>
            <div class="fa fa-money icon-service">
            </div>
            <h4>Vende tu vivienda</h4>
            <p>Si necesitas vender una vivienda, ponte en contacto con nosotros. Con nuestra experiencia en el sector y en la zona haremos este trámite de forma rápida y sencilla.                </p>
        </div>',
                raw_en:
                '<div class="col-md-4 single-service">
            <div class="bordered top-bordered">
            </div>
            <div class="fa fa-money icon-service">
            </div>
            <h4>Sell your property</h4>
            <p>If you need to sell your property, get in touch with us.  With our experience in the industry and the local area we will get it done in the quickest and simplest way.</p>
        </div>
    ' },
          ])
        end
      end

    end
  end
end
