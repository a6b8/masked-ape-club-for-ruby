require '../lib/masked_ape_club'

a = MaskedApeClub::Load.new()

item = {
    id: 1711,
    fuzz: '1%',
    path: './test/result/test.png',
    background: {
        path: './test/template/ice.png',
        size: 400
    }
}

a.load( id: item[:id] )
a.mask_ape( id: item[:id], fuzz: item[:fuzz] )
a.write( path: './test/preview/mask_ape.png' )

a.censored()
a.write( path: './test/preview/censored.png' )

blob = open( item[:background][:path] ).read()
a.background( 
    blob: blob, 
    offset_x: 115, 
    offset_y: 631 - item[:background][:size]-1, 
    width: item[:background][:size], 
    height: item[:background][:size] 
)

a.write( path: './test/preview/background.png' )
