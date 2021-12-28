require 'masked_ape_club'

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