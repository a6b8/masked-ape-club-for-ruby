require 'json'

module Collection
    def self.load( gateway )
        path = '../lib/collection/0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D.json'
        data = open( path ).read()
        result = JSON.parse( data )

        # puts "result: #{JSON.parse( result['data'][0]['metadata'] )['image']}"
        result = result['data'].map { | a | 
            a['metadata'] = JSON.parse( a['metadata'] )
            a['metadata']['image'] = a['metadata']['image']
                .split( '//' )
                .last.insert( 0, gateway )
            a 
        }
        
        # puts "url: #{result[0]['metadata']['image']}"
    
        return result
    end
end