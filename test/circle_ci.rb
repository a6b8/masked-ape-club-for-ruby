require './lib/masked_ape_club'

require 'rmagick'
require 'yaml'


class ImageDiff
    MATRIX = 15
    
    def generate_array( image_path )
        result = []
        main_img = Magick::Image.read( image_path ).first
        unless main_img.nil?
            main_img.resize!(MATRIX, MATRIX)
            
            pixel_array = []
            avr_pixel = 0
            MATRIX.times do | i |
                pixel_array[ i ] = []
                MATRIX.times do | j |
                    temp_pixel = main_img.pixel_color( i, j )
                    pixel_array[ i ][ j ] = temp_pixel.intensity()
                    avr_pixel += pixel_array[ i ][ j ]
                end
            end
            
            avr_pixel = avr_pixel.to_f / ( MATRIX * MATRIX )
            
            MATRIX.times do | i |
                MATRIX.times do | j |
                    row = ( pixel_array[ i ][ j ] == 0 ) ? 0 : ( 2 * ( ( pixel_array[ i ][ j ] > avr_pixel ) ? pixel_array[ i ][ j ].to_f / avr_pixel : ( avr_pixel.to_f / pixel_array[ i ][ j ] ) * -1 ) ).round
                    row_str = "#{sprintf("%02d", (i + 10))}#{sprintf("%02d", (j + 10))}#{sprintf("%03d", (255 + row.to_i))}"
                    result << row_str.to_i
                end
            end
        end
        return result
    end
    

    def diff_images( image_path1, image_path2 )
      res_array1 = generate_array( image_path1 )
      res_array2 = generate_array( image_path2 )
      
      main_array = res_array1 & res_array2
      
      return ( main_array.length.to_f / ( MATRIX * MATRIX ) )#sprintf('%.6f',  ) )
    end
    
  end
  


a = MaskedApeClub::Load.new()

item = {
    test: {
        id: 1711,
        fuzz: '5%',
        path: './test/test/generated.png',
    },
    background: {
        path: './test/template/ice.png',
        size: 400
    },
    compare: {
        path: './test/test/compare.png'
    }
}

a.load( id: item[:test][:id] )
a.mask_ape( id: item[:test][:id], fuzz: item[:test][:fuzz])
a.censored()

blob = open( item[:background][:path] ).read()
a.background( 
    blob: blob, 
    offset_x: 115, 
    offset_y: 631 - item[:background][:size]-1, 
    width: item[:background][:size], 
    height: item[:background][:size] 
)

a.write( path: item[:test][:path] )


img_diff = ImageDiff.new
test = img_diff.diff_images(item[:test][:path] , item[:compare][:path] )
puts "Result: #{test}"

if( test > 0.99 ) 
    exit( 0 )
else
    exit( 1 )
end