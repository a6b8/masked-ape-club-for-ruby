# frozen_string_literal: true

require_relative 'masked_ape_club/version'
require_relative './collection/index'

require 'uri'
require 'net/http'
require 'rmagick'


module MaskedApeClub
    class Error < StandardError; end

    include Collection

    class Load

        attr_reader :gateway, :collection, :image
        

        def initialize( gateway: 'https://ipfs.io/ipfs/' )
            @gateway = gateway
            # puts ">> #{@gateway}"
            @collection = Collection.load( @gateway )
            @image = nil
            return true
        end


        def mask_ape( id: 1, fuzz: "1%" )
            blob = self.load( id: id )
            image = self.mask( fuzz: fuzz )
            return image
        end


        def load( id: 1 )
            token = @collection
                .find { | a | a['token_id'].to_i == id }

            url = token['metadata']['image']
            uri = URI( url )
            blob = Net::HTTP.get( uri )
            @image = Magick::Image.from_blob( blob ).first

            return true
        end


        def write( path: )
            @image.write( path )
            return true
        end


        def mask( fuzz: '1%', position: 1500, radius: 25 )
            image = @image
            image.format = 'PNG'
            image.fuzz = fuzz
            
            pixels = []
            image
                .each_pixel { | pixel, c, r | pixels.push( pixel ) }
            
            background_color = pixels[ position ]
                .to_color( Magick::AllCompliance, false, 8, true )
            
            mask = Magick::Image
                .new( image.columns, image.rows) { self.background_color = 'transparent'  }
            
            Magick::Draw.new
                .stroke('none')
                .stroke_width( 0 )
                .fill( 'white' )
                .roundrectangle( 0, 0, image.columns, image.rows, radius, radius )
                .draw( mask )
        
            size = radius
            cols = 631
            rows = 631
            
            img = Magick::Image.new( 631, 631) { self.background_color = 'transparent' }
            
            [ 
                [ 0, 0, size, 0, 0, size, 0, 0 ],
                [ cols, 0, cols-size, 0, cols, size, cols, 0 ],
                [ 0, rows, 0, rows-size, size, rows, 0, rows ],
                [ cols, rows, cols, rows-size, cols-size, rows, 0, rows ]
            ].each { | a |
                triangle = Magick::Draw.new
                triangle.fill( background_color )
                triangle.stroke('transparent')
                triangle.polygon( a[ 0 ], a[ 1 ], a[ 2 ], a[ 3 ], a[ 4 ], a[ 5 ], a[ 6 ], a[ 7 ] )
                triangle.draw( img ) 
            }

            w = 2
            [ 
                [ 0, 0, w, rows ],
                [ 0, 0, cols, w ],
                [ cols-w, 0, cols, cols ],
                [ 0, rows, cols, rows-w ]
            ].each { | a |
                gc = Magick::Draw.new
                gc.fill( background_color )
                gc.rectangle( a[ 0 ], a[ 1 ], a[ 2 ], a[ 3 ] )
                gc.draw( img )
            }
        
            @image = image
                .composite( img, 0, 0, Magick::OverCompositeOp)
                .paint_transparent( background_color )
            
            return @image
        end


        def censored( upper_left_x: 240, upper_left_y: 210, lower_right_x: 460, lower_right_y: 270, color: 'black' )
            censored = Magick::Draw.new
            censored.fill( color )
            censored.rectangle( upper_left_x, upper_left_y, lower_right_x, lower_right_y )
            censored.draw( @image )
            
            return true
        end


        def background( blob:, gravity: Magick::CenterGravity, offset_x: 0, offset_y: 0, width: 631, height: 631)
            background = Magick::Image.from_blob( blob ).first
            background.format = 'PNG'
            background.crop_resized!( 631, 631, gravity )

            @image.resize_to_fit!( width, height )
            @image = background.composite( @image, offset_x, offset_y, Magick::OverCompositeOp )

            return true
        end
    end
end
