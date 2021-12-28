require 'masked_ape_club'

a = MaskedApeClub::Load.new()

item = {
    id: 1711,
    fuzz: '1%',
    path: 'result/test.png',
    background: {
        path: 'template/ice.png',
        size: 400
    }
}

a.load( id: item[:id] )
a.mask_ape( id: item[:id], fuzz: item[:fuzz] )
a.write( path: 'preview/mask_ape.png' )